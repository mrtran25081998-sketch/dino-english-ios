-- ==============================================================================
-- DINO ENGLISH — MIGRATION 03: BUSINESS LOGIC & RPC FUNCTIONS
-- Target Database: PostgreSQL / Supabase
-- Mô tả: Trigger tự động tạo hồ sơ phụ huynh + bé khi đăng ký,
-- hàm RPC hoàn thành bài học bảo mật, tính toán cấp độ Dino 20 mốc,
-- và thống kê Dashboard phụ huynh.
-- ==============================================================================

-- 1. TRIGGER TỰ ĐỘNG TẠO PROFILES & CHILD ĐẦU TIÊN KHI PHỤ HUYNH ĐĂNG KÝ
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
DECLARE
    new_child_id UUID;
    v_kid_name TEXT;
    v_age_group TEXT;
BEGIN
    v_kid_name := COALESCE(new.raw_user_meta_data->>'kid_name', 'Bé Yêu');
    v_age_group := COALESCE(new.raw_user_meta_data->>'age_group', '6-8');

    -- 1.1. Tạo bản ghi phụ huynh
    INSERT INTO public.profiles (id, full_name, email)
    VALUES (
        new.id,
        COALESCE(new.raw_user_meta_data->>'full_name', 'Phụ huynh'),
        new.email
    )
    ON CONFLICT (id) DO UPDATE
    SET email = EXCLUDED.email,
        updated_at = timezone('utc'::text, now());

    -- 1.2. Tự động tạo hồ sơ bé đầu tiên
    INSERT INTO public.children (parent_id, display_name, age_group, avatar_url, current_level)
    VALUES (
        new.id,
        v_kid_name,
        v_age_group,
        'welcome',
        1
    )
    RETURNING id INTO new_child_id;

    -- 1.3. Khởi tạo tiến trình Dino cho bé với 10 sao vàng ban đầu
    INSERT INTO public.dino_progress (child_id, level, experience_points, total_stars, unlocked_milestones)
    VALUES (
        new_child_id,
        1,
        0,
        10,
        '["egg"]'::jsonb
    )
    ON CONFLICT (child_id) DO NOTHING;

    RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- 2. HÀM RPC TẠO HỒ SƠ BÉ MỚI (PHỤ HUYNH TẠO THÊM BÉ THỨ 2, 3,...)
CREATE OR REPLACE FUNCTION public.create_child_profile(
    p_display_name TEXT,
    p_age_group TEXT,
    p_avatar_url TEXT DEFAULT 'welcome'
)
RETURNS JSON AS $$
DECLARE
    cur_user_id UUID;
    new_child_id UUID;
BEGIN
    cur_user_id := auth.uid();
    IF cur_user_id IS NULL THEN
        RAISE EXCEPTION 'Bạn chưa đăng nhập!';
    END IF;

    IF p_display_name IS NULL OR length(trim(p_display_name)) = 0 THEN
        RAISE EXCEPTION 'Tên bé không được để trống!';
    END IF;

    IF p_age_group NOT IN ('3-5', '6-8', '9-12') THEN
        p_age_group := '6-8';
    END IF;

    -- Tạo hồ sơ bé
    INSERT INTO public.children (parent_id, display_name, age_group, avatar_url, current_level)
    VALUES (cur_user_id, trim(p_display_name), p_age_group, COALESCE(p_avatar_url, 'welcome'), 1)
    RETURNING id INTO new_child_id;

    -- Khởi tạo Dino Progress cho bé mới
    INSERT INTO public.dino_progress (child_id, level, experience_points, total_stars, unlocked_milestones)
    VALUES (new_child_id, 1, 0, 10, '["egg"]'::jsonb);

    RETURN json_build_object(
        'success', true,
        'child_id', new_child_id,
        'display_name', trim(p_display_name),
        'message', 'Đã tạo hồ sơ cho bé thành công!'
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. HÀM RPC HOÀN THÀNH HOẠT ĐỘNG / BÀI HỌC BẢO MẬT & CHỐNG GIAN LẬN SAO
CREATE OR REPLACE FUNCTION public.complete_lesson_activity(
    p_child_id UUID,
    p_lesson_id TEXT,
    p_activity_type TEXT,
    p_correct_answers INTEGER DEFAULT 0,
    p_total_questions INTEGER DEFAULT 0,
    p_score INTEGER DEFAULT 100,
    p_duration_seconds INTEGER DEFAULT 30
)
RETURNS JSON AS $$
DECLARE
    cur_user_id UUID;
    v_is_parent BOOLEAN;
    v_source_id TEXT;
    v_stars_awarded INTEGER := 0;
    v_total_stars INTEGER;
    v_completed_count INTEGER;
    v_new_level INTEGER := 1;
    v_is_new_level BOOLEAN := false;
    v_old_level INTEGER;
    v_reward_id UUID;
BEGIN
    cur_user_id := auth.uid();
    IF cur_user_id IS NULL THEN
        RAISE EXCEPTION 'Vui lòng đăng nhập để lưu tiến độ học tập!';
    END IF;

    -- 3.1. Xác minh quyền sở hữu: bé phải thuộc phụ huynh đang đăng nhập
    SELECT EXISTS (
        SELECT 1 FROM public.children WHERE id = p_child_id AND parent_id = cur_user_id
    ) INTO v_is_parent;

    IF NOT v_is_parent THEN
        RAISE EXCEPTION 'Bạn không có quyền cập nhật tiến độ của hồ sơ này!';
    END IF;

    -- 3.2. Lưu lịch sử hoạt động vào learning_attempts
    INSERT INTO public.learning_attempts (
        child_id, lesson_id, activity_type,
        correct_answers, total_questions, score, duration_seconds
    ) VALUES (
        p_child_id, p_lesson_id, p_activity_type,
        p_correct_answers, p_total_questions, p_score, p_duration_seconds
    );

    -- 3.3. Cơ chế thưởng sao chống gian lận & chống phát trùng
    v_source_id := p_lesson_id || '_' || p_activity_type;

    -- Thử cấp 5 sao cho hoạt động/bài học này
    BEGIN
        INSERT INTO public.reward_transactions (child_id, source_type, source_id, stars_delta)
        VALUES (p_child_id, 'activity', v_source_id, 5)
        RETURNING id INTO v_reward_id;

        -- Nếu insert thành công (chưa từng nhận trước đây) -> cộng 5 sao
        v_stars_awarded := 5;
    EXCEPTION WHEN unique_violation THEN
        -- Đã từng nhận sao cho hoạt động này rồi -> Không cộng thêm sao, tránh lặp
        v_stars_awarded := 0;
    END;

    -- 3.4. Cập nhật bảng learning_progress của bài học
    INSERT INTO public.learning_progress (child_id, lesson_id, status, words_learned, score, completed_at)
    VALUES (p_child_id, p_lesson_id, 'completed', 10, p_score, timezone('utc'::text, now()))
    ON CONFLICT (child_id, lesson_id) DO UPDATE
    SET status = 'completed',
        words_learned = 10,
        score = GREATEST(public.learning_progress.score, p_score),
        completed_at = timezone('utc'::text, now()),
        updated_at = timezone('utc'::text, now());

    -- 3.5. Đếm tổng số bài học đã hoàn thành của bé để tính Level Dino (20 mốc tiến hóa)
    SELECT COUNT(*) INTO v_completed_count
    FROM public.learning_progress
    WHERE child_id = p_child_id AND status = 'completed';

    -- Tính level: 120 bài chia đều cho 20 cấp độ (mỗi cấp cần 6 bài hoàn thành)
    v_new_level := LEAST(20, GREATEST(1, FLOOR((v_completed_count / 6.0)) + 1));

    -- Lấy level cũ
    SELECT level, total_stars INTO v_old_level, v_total_stars
    FROM public.dino_progress
    WHERE child_id = p_child_id;

    IF v_new_level > COALESCE(v_old_level, 1) THEN
        v_is_new_level := true;
    END IF;

    -- Cập nhật dino_progress
    UPDATE public.dino_progress
    SET total_stars = total_stars + v_stars_awarded,
        experience_points = experience_points + (p_score * 10),
        level = GREATEST(level, v_new_level),
        updated_at = timezone('utc'::text, now())
    WHERE child_id = p_child_id
    RETURNING total_stars, level INTO v_total_stars, v_new_level;

    -- Đồng bộ current_level sang bảng children
    UPDATE public.children
    SET current_level = v_new_level,
        updated_at = timezone('utc'::text, now())
    WHERE id = p_child_id;

    RETURN json_build_object(
        'success', true,
        'stars_awarded', v_stars_awarded,
        'total_stars', v_total_stars,
        'current_level', v_new_level,
        'is_new_level', v_is_new_level,
        'completed_lessons_count', v_completed_count
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 4. HÀM RPC LẤY THỐNG KÊ DASHBOARD PHỤ HUYNH
CREATE OR REPLACE FUNCTION public.get_parent_dashboard_stats(p_child_id UUID)
RETURNS JSON AS $$
DECLARE
    cur_user_id UUID;
    v_child RECORD;
    v_dino RECORD;
    v_lessons_completed INTEGER := 0;
    v_total_duration_sec INTEGER := 0;
    v_words_count INTEGER := 0;
    v_topics_summary JSON;
BEGIN
    cur_user_id := auth.uid();
    IF cur_user_id IS NULL THEN
        RAISE EXCEPTION 'Vui lòng đăng nhập!';
    END IF;

    -- Xác minh quyền phụ huynh
    SELECT * INTO v_child
    FROM public.children
    WHERE id = p_child_id AND parent_id = cur_user_id;

    IF v_child IS NULL THEN
        RAISE EXCEPTION 'Không tìm thấy hồ sơ của bé!';
    END IF;

    -- Lấy thông tin Dino
    SELECT * INTO v_dino
    FROM public.dino_progress
    WHERE child_id = p_child_id;

    -- Tính tổng bài hoàn thành
    SELECT COUNT(*) INTO v_lessons_completed
    FROM public.learning_progress
    WHERE child_id = p_child_id AND status = 'completed';

    v_words_count := v_lessons_completed * 10;

    -- Tính tổng thời gian học (từ learning_attempts)
    SELECT COALESCE(SUM(duration_seconds), 0) INTO v_total_duration_sec
    FROM public.learning_attempts
    WHERE child_id = p_child_id;

    -- Thống kê theo từng chủ đề
    SELECT json_agg(t_stat) INTO v_topics_summary
    FROM (
        SELECT 
            t.id AS topic_id,
            t.name_vi,
            t.name_en,
            t.color_hex,
            COUNT(lp.id) FILTER (WHERE lp.status = 'completed') AS completed_lessons,
            10 AS total_lessons
        FROM public.topics t
        LEFT JOIN public.lessons l ON l.topic_id = t.id
        LEFT JOIN public.learning_progress lp ON lp.lesson_id = l.id AND lp.child_id = p_child_id
        GROUP BY t.id, t.name_vi, t.name_en, t.color_hex, t.display_order
        ORDER BY t.display_order
    ) t_stat;

    RETURN json_build_object(
        'child_id', v_child.id,
        'display_name', v_child.display_name,
        'age_group', v_child.age_group,
        'avatar_url', v_child.avatar_url,
        'level', COALESCE(v_dino.level, 1),
        'total_stars', COALESCE(v_dino.total_stars, 10),
        'completed_lessons', v_lessons_completed,
        'words_learned', v_words_count,
        'learning_minutes', ROUND(v_total_duration_sec / 60.0),
        'topics', COALESCE(v_topics_summary, '[]'::json)
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
