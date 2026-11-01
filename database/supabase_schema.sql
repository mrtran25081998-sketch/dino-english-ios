-- ==============================================================================
-- DINO ENGLISH — BACKEND SUPABASE DATABASE SCHEMA
-- Project ID: wsaalmeuduiyqbptnrmy
-- Tính năng: Xác thực người dùng, hồ sơ bé, ghi nhớ bài học và đồng bộ tiến độ
-- ==============================================================================

-- 1. BẬT TIỆN ÍCH UUID (NẾU CHƯA CÓ)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. BẢNG HỒ SƠ BÉ & THÔNG TIN HỌC TẬP (PROFILES)
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT,
    kid_name TEXT NOT NULL DEFAULT 'Bé Yêu',
    avatar_mascot TEXT NOT NULL DEFAULT 'welcome',
    stars INTEGER NOT NULL DEFAULT 10 CHECK (stars >= 0),
    streak INTEGER NOT NULL DEFAULT 1 CHECK (streak >= 0),
    evolution_level INTEGER NOT NULL DEFAULT 1,
    current_topic_id TEXT NOT NULL DEFAULT 'animals',
    current_lesson_id INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 3. BẢNG TIẾN ĐỘ BÀI HỌC (LESSON PROGRESS - Ghi nhớ bài học đã hoàn thành)
CREATE TABLE IF NOT EXISTS public.lesson_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    topic_id TEXT NOT NULL,
    lesson_id INTEGER NOT NULL,
    lesson_key TEXT NOT NULL, -- Ví dụ: 'animals_l1'
    stars_earned INTEGER NOT NULL DEFAULT 5,
    is_completed BOOLEAN NOT NULL DEFAULT true,
    completed_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT unique_user_lesson UNIQUE (user_id, lesson_key)
);

-- 4. BẢNG TIẾN ĐỘ HOẠT ĐỘNG (ACTIVITY PROGRESS - Từ vựng, phát âm, game, bài hát)
CREATE TABLE IF NOT EXISTS public.activity_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    topic_id TEXT NOT NULL,
    lesson_id INTEGER NOT NULL,
    activity_type TEXT NOT NULL CHECK (activity_type IN ('vocab', 'pron', 'game', 'song')),
    activity_key TEXT NOT NULL, -- Ví dụ: 'animals_l1_vocab'
    score INTEGER NOT NULL DEFAULT 100,
    completed_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT unique_user_activity UNIQUE (user_id, activity_key)
);

-- 5. BẬT ROW LEVEL SECURITY (RLS) - BẢO MẬT DỮ LIỆU TỪNG BÉ
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lesson_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.activity_progress ENABLE ROW LEVEL SECURITY;

-- 5.1. RLS CHO BẢNG PROFILES
DROP POLICY IF EXISTS "Users can view own profile" ON public.profiles;
CREATE POLICY "Users can view own profile" 
ON public.profiles FOR SELECT 
USING (auth.uid() = id);

DROP POLICY IF EXISTS "Users can update own profile" ON public.profiles;
CREATE POLICY "Users can update own profile" 
ON public.profiles FOR UPDATE 
USING (auth.uid() = id);

DROP POLICY IF EXISTS "Users can insert own profile" ON public.profiles;
CREATE POLICY "Users can insert own profile" 
ON public.profiles FOR INSERT 
WITH CHECK (auth.uid() = id);

-- 5.2. RLS CHO BẢNG LESSON_PROGRESS
DROP POLICY IF EXISTS "Users can view own lesson progress" ON public.lesson_progress;
CREATE POLICY "Users can view own lesson progress" 
ON public.lesson_progress FOR SELECT 
USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert own lesson progress" ON public.lesson_progress;
CREATE POLICY "Users can insert own lesson progress" 
ON public.lesson_progress FOR INSERT 
WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own lesson progress" ON public.lesson_progress;
CREATE POLICY "Users can update own lesson progress" 
ON public.lesson_progress FOR UPDATE 
USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own lesson progress" ON public.lesson_progress;
CREATE POLICY "Users can delete own lesson progress" 
ON public.lesson_progress FOR DELETE 
USING (auth.uid() = user_id);

-- 5.3. RLS CHO BẢNG ACTIVITY_PROGRESS
DROP POLICY IF EXISTS "Users can view own activity progress" ON public.activity_progress;
CREATE POLICY "Users can view own activity progress" 
ON public.activity_progress FOR SELECT 
USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert own activity progress" ON public.activity_progress;
CREATE POLICY "Users can insert own activity progress" 
ON public.activity_progress FOR INSERT 
WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own activity progress" ON public.activity_progress;
CREATE POLICY "Users can update own activity progress" 
ON public.activity_progress FOR UPDATE 
USING (auth.uid() = user_id);

-- 6. TRIGGER TỰ ĐỘNG TẠO PROFILE KHI ĐĂNG KÝ TÀI KHOẢN MỚI
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
    INSERT INTO public.profiles (id, email, kid_name, stars, streak, avatar_mascot)
    VALUES (
        new.id,
        new.email,
        COALESCE(new.raw_user_meta_data->>'kid_name', 'Bé Yêu'),
        COALESCE((new.raw_user_meta_data->>'stars')::integer, 10),
        1,
        'welcome'
    )
    ON CONFLICT (id) DO UPDATE
    SET email = EXCLUDED.email,
        updated_at = timezone('utc'::text, now());
    RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- 7. HÀM RPC ĐỒNG BỘ TIẾN ĐỘ NHANH (SYNC ALL PROGRESS)
CREATE OR REPLACE FUNCTION public.sync_learning_progress(
    p_kid_name TEXT,
    p_stars INTEGER,
    p_streak INTEGER,
    p_topic_id TEXT,
    p_lesson_id INTEGER,
    p_completed_lessons TEXT[],
    p_completed_activities TEXT[]
)
RETURNS JSON AS $$
DECLARE
    cur_user_id UUID;
    l_key TEXT;
    a_key TEXT;
    t_id TEXT;
    l_id INTEGER;
    parts TEXT[];
BEGIN
    cur_user_id := auth.uid();
    IF cur_user_id IS NULL THEN
        RAISE EXCEPTION 'Not authenticated';
    END IF;

    -- Cập nhật profile
    UPDATE public.profiles
    SET kid_name = COALESCE(p_kid_name, kid_name),
        stars = GREATEST(stars, p_stars),
        streak = GREATEST(streak, p_streak),
        current_topic_id = COALESCE(p_topic_id, current_topic_id),
        current_lesson_id = COALESCE(p_lesson_id, current_lesson_id),
        updated_at = timezone('utc'::text, now())
    WHERE id = cur_user_id;

    -- Đồng bộ danh sách bài học
    IF p_completed_lessons IS NOT NULL THEN
        FOREACH l_key IN ARRAY p_completed_lessons
        LOOP
            parts := string_to_array(l_key, '_l');
            t_id := parts[1];
            l_id := (parts[2])::integer;
            
            INSERT INTO public.lesson_progress (user_id, topic_id, lesson_id, lesson_key, stars_earned, is_completed)
            VALUES (cur_user_id, t_id, l_id, l_key, 5, true)
            ON CONFLICT (user_id, lesson_key) DO NOTHING;
        END LOOP;
    END IF;

    -- Đồng bộ danh sách hoạt động
    IF p_completed_activities IS NOT NULL THEN
        FOREACH a_key IN ARRAY p_completed_activities
        LOOP
            INSERT INTO public.activity_progress (user_id, topic_id, lesson_id, activity_type, activity_key)
            VALUES (cur_user_id, 'animals', 1, 'vocab', a_key)
            ON CONFLICT (user_id, activity_key) DO NOTHING;
        END LOOP;
    END IF;

    RETURN json_build_object(
        'success', true,
        'message', 'Đồng bộ tiến độ học tập thành công!'
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
