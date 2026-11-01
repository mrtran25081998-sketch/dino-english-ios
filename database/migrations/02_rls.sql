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
