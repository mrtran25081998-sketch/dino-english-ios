-- DINO ENGLISH SUPABASE MASTER SCHEMA

-- ==============================================================================
-- DINO ENGLISH — MIGRATION 01: DATABASE SCHEMA
-- Target Database: PostgreSQL / Supabase
-- Mô tả: Khởi tạo đầy đủ bảng, quan hệ, indexes và trigger tự động cập nhật
-- ==============================================================================

-- 1. BẬT EXTENSIONS CẦN THIẾT
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- 2. HÀM TỰ ĐỘNG CẬP NHẬT updated_at
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = timezone('utc'::text, now());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. BẢNG PROFILES (THÔNG TIN PHỤ HUYNH)
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    full_name TEXT NOT NULL DEFAULT 'Phụ huynh',
    email TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

DROP TRIGGER IF EXISTS trigger_profiles_updated_at ON public.profiles;
CREATE TRIGGER trigger_profiles_updated_at
    BEFORE UPDATE ON public.profiles
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- 4. BẢNG CHILDREN (HỒ SƠ CỦA BÉ — 1 PHỤ HUYNH CÓ THỂ CÓ NHIỀU BÉ)
CREATE TABLE IF NOT EXISTS public.children (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    parent_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    display_name TEXT NOT NULL,
    age_group TEXT NOT NULL CHECK (age_group IN ('3-5', '6-8', '9-12')),
    avatar_url TEXT NOT NULL DEFAULT 'welcome',
    current_level INTEGER NOT NULL DEFAULT 1 CHECK (current_level >= 1 AND current_level <= 20),
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_children_parent_id ON public.children(parent_id);

DROP TRIGGER IF EXISTS trigger_children_updated_at ON public.children;
CREATE TRIGGER trigger_children_updated_at
    BEFORE UPDATE ON public.children
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- 5. BẢNG TOPICS (12 CHỦ ĐỀ HỌC)
CREATE TABLE IF NOT EXISTS public.topics (
    id TEXT PRIMARY KEY,
    name_vi TEXT NOT NULL,
    name_en TEXT NOT NULL,
    description TEXT,
    icon_url TEXT,
    color_hex TEXT DEFAULT '#30a953',
    display_order INTEGER NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 6. BẢNG LESSONS (120 BÀI HỌC — 10 BÀI MỖI CHỦ ĐỀ)
CREATE TABLE IF NOT EXISTS public.lessons (
    id TEXT PRIMARY KEY, -- e.g. 'animals_l1'
    topic_id TEXT NOT NULL REFERENCES public.topics(id) ON DELETE CASCADE,
    title_vi TEXT NOT NULL,
    title_en TEXT NOT NULL,
    lesson_number INTEGER NOT NULL CHECK (lesson_number >= 1 AND lesson_number <= 10),
    difficulty TEXT NOT NULL DEFAULT 'beginner' CHECK (difficulty IN ('beginner', 'intermediate', 'advanced')),
    display_order INTEGER NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_lessons_topic_id ON public.lessons(topic_id);
CREATE INDEX IF NOT EXISTS idx_lessons_order ON public.lessons(topic_id, display_order);

-- 7. BẢNG VOCABULARY (1.200 TỪ VỰNG CHUẨN IPA & VÍ DỤ)
CREATE TABLE IF NOT EXISTS public.vocabulary (
    id TEXT PRIMARY KEY, -- e.g. 'animals_l01_w01_cat'
    lesson_id TEXT NOT NULL REFERENCES public.lessons(id) ON DELETE CASCADE,
    word_en TEXT NOT NULL,
    meaning_vi TEXT NOT NULL,
    phonetic TEXT NOT NULL,
    image_url TEXT,
    audio_url TEXT,
    example_sentence TEXT,
    example_translation TEXT,
    symbol_name TEXT DEFAULT 'star.fill',
    display_order INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_vocabulary_lesson_id ON public.vocabulary(lesson_id);
CREATE INDEX IF NOT EXISTS idx_vocabulary_order ON public.vocabulary(lesson_id, display_order);

-- 8. BẢNG SONGS (12 BÀI HÁT THEO CHỦ ĐỀ)
CREATE TABLE IF NOT EXISTS public.songs (
    id TEXT PRIMARY KEY,
    topic_id TEXT NOT NULL REFERENCES public.topics(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    audio_url TEXT,
    lyrics JSONB NOT NULL DEFAULT '[]'::jsonb,
    lyrics_vi JSONB NOT NULL DEFAULT '[]'::jsonb,
    duration_seconds INTEGER NOT NULL DEFAULT 60,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_songs_topic_id ON public.songs(topic_id);

-- 9. BẢNG LEARNING_PROGRESS (TIẾN ĐỘ BÀI HỌC CỦA TỪNG BÉ)
CREATE TABLE IF NOT EXISTS public.learning_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    child_id UUID NOT NULL REFERENCES public.children(id) ON DELETE CASCADE,
    lesson_id TEXT NOT NULL REFERENCES public.lessons(id) ON DELETE CASCADE,
    status TEXT NOT NULL CHECK (status IN ('not_started', 'in_progress', 'completed')) DEFAULT 'in_progress',
    words_learned INTEGER NOT NULL DEFAULT 0,
    score INTEGER NOT NULL DEFAULT 0,
    started_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    completed_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT unique_child_lesson UNIQUE (child_id, lesson_id)
);

CREATE INDEX IF NOT EXISTS idx_learning_progress_child ON public.learning_progress(child_id);
CREATE INDEX IF NOT EXISTS idx_learning_progress_lesson ON public.learning_progress(child_id, lesson_id);

DROP TRIGGER IF EXISTS trigger_learning_progress_updated_at ON public.learning_progress;
CREATE TRIGGER trigger_learning_progress_updated_at
    BEFORE UPDATE ON public.learning_progress
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- 10. BẢNG LEARNING_ATTEMPTS (LỊCH SỬ HOẠT ĐỘNG: FLASHCARD, PHÁT ÂM, GAME, BÀI HÁT)
CREATE TABLE IF NOT EXISTS public.learning_attempts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    child_id UUID NOT NULL REFERENCES public.children(id) ON DELETE CASCADE,
    lesson_id TEXT NOT NULL REFERENCES public.lessons(id) ON DELETE CASCADE,
    activity_type TEXT NOT NULL CHECK (activity_type IN ('vocab', 'pron', 'game', 'song')),
    correct_answers INTEGER NOT NULL DEFAULT 0,
    total_questions INTEGER NOT NULL DEFAULT 0,
    score INTEGER NOT NULL DEFAULT 0,
    duration_seconds INTEGER NOT NULL DEFAULT 0,
    completed_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_learning_attempts_child_lesson ON public.learning_attempts(child_id, lesson_id);
CREATE INDEX IF NOT EXISTS idx_learning_attempts_time ON public.learning_attempts(completed_at DESC);

-- 11. BẢNG REWARD_TRANSACTIONS (LỊCH SỬ THƯỞNG SAO — CHỐNG THƯỞNG TRÙNG)
CREATE TABLE IF NOT EXISTS public.reward_transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    child_id UUID NOT NULL REFERENCES public.children(id) ON DELETE CASCADE,
    source_type TEXT NOT NULL CHECK (source_type IN ('lesson_completion', 'activity', 'streak', 'milestone', 'bonus')),
    source_id TEXT NOT NULL, -- e.g. 'animals_l1' hoặc 'animals_l1_vocab'
    stars_delta INTEGER NOT NULL CHECK (stars_delta > 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT unique_child_reward UNIQUE (child_id, source_type, source_id)
);

CREATE INDEX IF NOT EXISTS idx_reward_transactions_child ON public.reward_transactions(child_id);

-- 12. BẢNG DINO_PROGRESS (CẤP ĐỘ TIẾN HÓA DINO & XP CỦA BÉ)
CREATE TABLE IF NOT EXISTS public.dino_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    child_id UUID NOT NULL REFERENCES public.children(id) ON DELETE CASCADE UNIQUE,
    level INTEGER NOT NULL DEFAULT 1 CHECK (level >= 1 AND level <= 20),
    experience_points INTEGER NOT NULL DEFAULT 0 CHECK (experience_points >= 0),
    total_stars INTEGER NOT NULL DEFAULT 10 CHECK (total_stars >= 0),
    unlocked_milestones JSONB NOT NULL DEFAULT '[]'::jsonb,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

DROP TRIGGER IF EXISTS trigger_dino_progress_updated_at ON public.dino_progress;
CREATE TRIGGER trigger_dino_progress_updated_at
    BEFORE UPDATE ON public.dino_progress
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- 13. BẢNG ACHIEVEMENTS & CHILD_ACHIEVEMENTS (HUY HIỆU THÀNH TÍCH)
CREATE TABLE IF NOT EXISTS public.achievements (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    icon_url TEXT,
    unlock_condition JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE TABLE IF NOT EXISTS public.child_achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    child_id UUID NOT NULL REFERENCES public.children(id) ON DELETE CASCADE,
    achievement_id TEXT NOT NULL REFERENCES public.achievements(id) ON DELETE CASCADE,
    unlocked_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT unique_child_achievement UNIQUE (child_id, achievement_id)
);

CREATE INDEX IF NOT EXISTS idx_child_achievements ON public.child_achievements(child_id);


-- ==============================================================================
-- DINO ENGLISH — MIGRATION 02: ROW LEVEL SECURITY (RLS) POLICIES
-- Target Database: PostgreSQL / Supabase
-- Mô tả: Bảo mật dữ liệu nhiều tầng. Mỗi phụ huynh chỉ truy cập hồ sơ của mình
-- và hồ sơ các bé trực thuộc tài khoản mình. Chặn gian lận điểm số.
-- ==============================================================================

-- 1. BẬT ROW LEVEL SECURITY TRÊN TẤT CẢ CÁC BẢNG
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.children ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vocabulary ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.songs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.learning_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.learning_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.reward_transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.dino_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.child_achievements ENABLE ROW LEVEL SECURITY;

-- 2. POLICIES CHO BẢNG PROFILES (PHỤ HUYNH)
DROP POLICY IF EXISTS "profiles_select_own" ON public.profiles;
CREATE POLICY "profiles_select_own" ON public.profiles
    FOR SELECT USING (auth.uid() = id);

DROP POLICY IF EXISTS "profiles_insert_own" ON public.profiles;
CREATE POLICY "profiles_insert_own" ON public.profiles
    FOR INSERT WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "profiles_update_own" ON public.profiles;
CREATE POLICY "profiles_update_own" ON public.profiles
    FOR UPDATE USING (auth.uid() = id);

-- 3. POLICIES CHO BẢNG CHILDREN (HỒ SƠ BÉ)
DROP POLICY IF EXISTS "children_select_parent" ON public.children;
CREATE POLICY "children_select_parent" ON public.children
    FOR SELECT USING (parent_id = auth.uid());

DROP POLICY IF EXISTS "children_insert_parent" ON public.children;
CREATE POLICY "children_insert_parent" ON public.children
    FOR INSERT WITH CHECK (parent_id = auth.uid());

DROP POLICY IF EXISTS "children_update_parent" ON public.children;
CREATE POLICY "children_update_parent" ON public.children
    FOR UPDATE USING (parent_id = auth.uid());

DROP POLICY IF EXISTS "children_delete_parent" ON public.children;
CREATE POLICY "children_delete_parent" ON public.children
    FOR DELETE USING (parent_id = auth.uid());

-- 4. POLICIES CHO NỘI DUNG HỌC TẬP (TOPICS, LESSONS, VOCABULARY, SONGS, ACHIEVEMENTS)
-- Cho phép đọc công khai (Public Read-only cho cả bé và phụ huynh), chỉ Admin/Service_role được ghi.
DROP POLICY IF EXISTS "topics_public_read" ON public.topics;
CREATE POLICY "topics_public_read" ON public.topics
    FOR SELECT USING (is_active = true);

DROP POLICY IF EXISTS "lessons_public_read" ON public.lessons;
CREATE POLICY "lessons_public_read" ON public.lessons
    FOR SELECT USING (is_active = true);

DROP POLICY IF EXISTS "vocabulary_public_read" ON public.vocabulary;
CREATE POLICY "vocabulary_public_read" ON public.vocabulary
    FOR SELECT USING (true);

DROP POLICY IF EXISTS "songs_public_read" ON public.songs;
CREATE POLICY "songs_public_read" ON public.songs
    FOR SELECT USING (is_active = true);

DROP POLICY IF EXISTS "achievements_public_read" ON public.achievements;
CREATE POLICY "achievements_public_read" ON public.achievements
    FOR SELECT USING (true);

-- 5. POLICIES CHO LEARNING_PROGRESS (TIẾN ĐỘ BÀI HỌC)
DROP POLICY IF EXISTS "learning_progress_select" ON public.learning_progress;
CREATE POLICY "learning_progress_select" ON public.learning_progress
    FOR SELECT USING (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

DROP POLICY IF EXISTS "learning_progress_insert" ON public.learning_progress;
CREATE POLICY "learning_progress_insert" ON public.learning_progress
    FOR INSERT WITH CHECK (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

DROP POLICY IF EXISTS "learning_progress_update" ON public.learning_progress;
CREATE POLICY "learning_progress_update" ON public.learning_progress
    FOR UPDATE USING (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

DROP POLICY IF EXISTS "learning_progress_delete" ON public.learning_progress;
CREATE POLICY "learning_progress_delete" ON public.learning_progress
    FOR DELETE USING (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

-- 6. POLICIES CHO LEARNING_ATTEMPTS (LỊCH SỬ HOẠT ĐỘNG)
DROP POLICY IF EXISTS "learning_attempts_select" ON public.learning_attempts;
CREATE POLICY "learning_attempts_select" ON public.learning_attempts
    FOR SELECT USING (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

DROP POLICY IF EXISTS "learning_attempts_insert" ON public.learning_attempts;
CREATE POLICY "learning_attempts_insert" ON public.learning_attempts
    FOR INSERT WITH CHECK (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

-- 7. POLICIES CHO REWARD_TRANSACTIONS (LỊCH SỬ NHẬN SAO)
-- Chỉ cho phép phụ huynh xem lịch sử thưởng của con mình.
-- Việc thêm phần thưởng BẮT BUỘC thực hiện qua RPC có xác thực để chống gian lận.
DROP POLICY IF EXISTS "reward_transactions_select" ON public.reward_transactions;
CREATE POLICY "reward_transactions_select" ON public.reward_transactions
    FOR SELECT USING (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

-- 8. POLICIES CHO DINO_PROGRESS (CẤP ĐỘ VÀ SAO)
DROP POLICY IF EXISTS "dino_progress_select" ON public.dino_progress;
CREATE POLICY "dino_progress_select" ON public.dino_progress
    FOR SELECT USING (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );

-- 9. POLICIES CHO CHILD_ACHIEVEMENTS
DROP POLICY IF EXISTS "child_achievements_select" ON public.child_achievements;
CREATE POLICY "child_achievements_select" ON public.child_achievements
    FOR SELECT USING (
        child_id IN (SELECT id FROM public.children WHERE parent_id = auth.uid())
    );


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
