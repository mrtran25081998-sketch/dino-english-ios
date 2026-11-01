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
