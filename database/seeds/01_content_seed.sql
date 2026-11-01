-- ==============================================================================
-- DINO ENGLISH — SEED CONTENT (12 CHỦ ĐỀ · 120 BÀI HỌC · 1.200 TỪ VỰNG · 12 BÀI HÁT)
-- Tự động sinh từ: iOS/DinoEnglish/Data/DinoContent.json
-- Đảm bảo tính toàn vẹn: 12 topics x 10 lessons x 10 words = 1.200 từ vựng chuẩn IPA
-- ==============================================================================

BEGIN;

-- 1. SEED 12 TOPICS
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('animals', 'Con vật', 'Animals', 'Khám phá thế giới động vật đáng yêu cùng Dino', '#30a953', 1, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('colors', 'Màu sắc', 'Colors', 'Bé tô màu rực rỡ cho thế giới xung quanh', '#e63946', 2, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('fruits', 'Trái cây', 'Fruits', 'Các loại hoa quả thơm ngon, bổ dưỡng', '#f77f00', 3, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('family', 'Gia đình', 'Family', 'Yêu thương những người thân trong gia đình', '#fcbf49', 4, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('food', 'Đồ ăn thức uống', 'Food', 'Món ăn ngon và thói quen ăn uống lành mạnh', '#d62828', 5, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('body', 'Cơ thể', 'Body', 'Tìm hiểu các bộ phận trên cơ thể bé', '#0077b6', 6, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('school', 'Trường học', 'School', 'Đồ dùng học tập và lớp học thân thương', '#457b9d', 7, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('nature', 'Tự nhiên', 'Nature', 'Bầu trời, thời tiết và cảnh sắc thiên nhiên', '#2a9d8f', 8, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('vehicles', 'Phương tiện', 'Vehicles', 'Xe cộ trên đường và an toàn giao thông', '#e76f51', 9, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('clothing', 'Trang phục', 'Clothing', 'Quần áo đẹp và phụ kiện xinh xắn', '#9b5de5', 10, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('feelings', 'Cảm xúc', 'Feelings', 'Hiểu và chia sẻ cảm xúc vui buồn mỗi ngày', '#f15bb5', 11, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;
INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES ('actions', 'Hành động', 'Actions', 'Các hành động vui chơi, vận động và học tập', '#00bbf9', 12, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;

-- 2. SEED 120 LESSONS
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l1', 'animals', 'Thú cưng thân quen', 'Thú cưng thân quen', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l2', 'animals', 'Động vật nông trại', 'Động vật nông trại', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l3', 'animals', 'Động vật hoang dã', 'Động vật hoang dã', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l4', 'animals', 'Sinh vật đại dương', 'Sinh vật đại dương', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l5', 'animals', 'Các loài chim', 'Các loài chim', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l6', 'animals', 'Côn trùng & loài nhỏ', 'Côn trùng & loài nhỏ', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l7', 'animals', 'Động vật rừng xanh', 'Động vật rừng xanh', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l8', 'animals', 'Bò sát & Lưỡng cư', 'Bò sát & Lưỡng cư', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l9', 'animals', 'Động vật vùng lạnh & sa mạc', 'Động vật vùng lạnh & sa mạc', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('animals_l10', 'animals', 'Bộ phận & đặc điểm động vật', 'Bộ phận & đặc điểm động vật', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l1', 'colors', 'Màu sắc cơ bản', 'Màu sắc cơ bản', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l2', 'colors', 'Gam màu pastel nhẹ nhàng', 'Gam màu pastel nhẹ nhàng', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l3', 'colors', 'Sắc độ đậm nhạt', 'Sắc độ đậm nhạt', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l4', 'colors', 'Sắc màu thiên nhiên', 'Sắc màu thiên nhiên', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l5', 'colors', 'Sắc màu muông thú', 'Sắc màu muông thú', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l6', 'colors', 'Màu sắc từ đồ ăn ngon', 'Màu sắc từ đồ ăn ngon', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l7', 'colors', 'Sắc màu cầu vồng', 'Sắc màu cầu vồng', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l8', 'colors', 'Mô tả sắc màu xung quanh', 'Mô tả sắc màu xung quanh', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l9', 'colors', 'Pha trộn màu sắc', 'Pha trộn màu sắc', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('colors_l10', 'colors', 'Dụng cụ vẽ & hội họa', 'Dụng cụ vẽ & hội họa', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l1', 'fruits', 'Trái cây hàng ngày', 'Trái cây hàng ngày', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l2', 'fruits', 'Các loại quả mọng', 'Các loại quả mọng', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l3', 'fruits', 'Trái cây nhiệt đới', 'Trái cây nhiệt đới', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l4', 'fruits', 'Trái cây vườn nhà', 'Trái cây vườn nhà', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l5', 'fruits', 'Họ cam quýt', 'Họ cam quýt', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l6', 'fruits', 'Dưa & quả dây leo', 'Dưa & quả dây leo', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l7', 'fruits', 'Trái cây đặc sản châu Á', 'Trái cây đặc sản châu Á', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l8', 'fruits', 'Các loại hạt & nhân dinh dưỡng', 'Các loại hạt & nhân dinh dưỡng', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l9', 'fruits', 'Các phần của quả', 'Các phần của quả', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('fruits_l10', 'fruits', 'Hương vị & trạng thái quả', 'Hương vị & trạng thái quả', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l1', 'family', 'Gia đình thân yêu', 'Gia đình thân yêu', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l2', 'family', 'Ông bà kính yêu', 'Ông bà kính yêu', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l3', 'family', 'Họ hàng thân thuộc', 'Họ hàng thân thuộc', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l4', 'family', 'Yêu thương & gắn kết', 'Yêu thương & gắn kết', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l5', 'family', 'Nhịp sống gia đình', 'Nhịp sống gia đình', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l6', 'family', 'Các phòng trong nhà', 'Các phòng trong nhà', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l7', 'family', 'Hoạt động cùng nhau', 'Hoạt động cùng nhau', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l8', 'family', 'Những dịp kỷ niệm', 'Những dịp kỷ niệm', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l9', 'family', 'Tình cảm gia đình', 'Tình cảm gia đình', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('family_l10', 'family', 'Các thế hệ tiếp nối', 'Các thế hệ tiếp nối', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l1', 'food', 'Bữa sáng tràn năng lượng', 'Bữa sáng tràn năng lượng', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l2', 'food', 'Bữa trưa & Bữa tối', 'Bữa trưa & Bữa tối', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l3', 'food', 'Rau củ tươi xanh', 'Rau củ tươi xanh', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l4', 'food', 'Đồ uống giải khát', 'Đồ uống giải khát', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l5', 'food', 'Món ngọt tráng miệng', 'Món ngọt tráng miệng', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l6', 'food', 'Món ăn vặt thơm ngon', 'Món ăn vặt thơm ngon', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l7', 'food', 'Dụng cụ ăn uống', 'Dụng cụ ăn uống', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l8', 'food', 'Hành động làm bếp', 'Hành động làm bếp', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l9', 'food', 'Hương vị phong phú', 'Hương vị phong phú', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('food_l10', 'food', 'Thói quen ăn uống lành mạnh', 'Thói quen ăn uống lành mạnh', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l1', 'body', 'Khuôn mặt xinh xắn', 'Khuôn mặt xinh xắn', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l2', 'body', 'Thân trên & Cánh tay', 'Thân trên & Cánh tay', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l3', 'body', 'Đôi chân nhanh nhẹn', 'Đôi chân nhanh nhẹn', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l4', 'body', 'Năm giác quan kỳ diệu', 'Năm giác quan kỳ diệu', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l5', 'body', 'Vận động cơ thể', 'Vận động cơ thể', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l6', 'body', 'Bên trong cơ thể bé', 'Bên trong cơ thể bé', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l7', 'body', 'Chăm sóc sức khỏe', 'Chăm sóc sức khỏe', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l8', 'body', 'Cảm giác thể chất', 'Cảm giác thể chất', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l9', 'body', 'Lớn khôn từng ngày', 'Lớn khôn từng ngày', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('body_l10', 'body', 'Giữ gìn vệ sinh cá nhân', 'Giữ gìn vệ sinh cá nhân', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l1', 'school', 'Đồ dùng học tập', 'Đồ dùng học tập', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l2', 'school', 'Dụng cụ thủ công mỹ thuật', 'Dụng cụ thủ công mỹ thuật', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l3', 'school', 'Thầy cô & Bạn bè', 'Thầy cô & Bạn bè', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l4', 'school', 'Các góc trong trường', 'Các góc trong trường', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l5', 'school', 'Môn học thú vị', 'Môn học thú vị', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l6', 'school', 'Hành động trong lớp', 'Hành động trong lớp', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l7', 'school', 'Hình khối toán học', 'Hình khối toán học', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l8', 'school', 'Đếm số 1 đến 10', 'Đếm số 1 đến 10', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l9', 'school', 'Giờ chơi & Sinh hoạt', 'Giờ chơi & Sinh hoạt', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('school_l10', 'school', 'Nề nếp ngoan ngoãn', 'Nề nếp ngoan ngoãn', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l1', 'nature', 'Bầu trời & Thời tiết', 'Bầu trời & Thời tiết', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l2', 'nature', 'Ngày đêm & Bốn mùa', 'Ngày đêm & Bốn mùa', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l3', 'nature', 'Địa hình mặt đất', 'Địa hình mặt đất', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l4', 'nature', 'Cây cối xanh tươi', 'Cây cối xanh tươi', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l5', 'nature', 'Những đóa hoa xinh', 'Những đóa hoa xinh', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l6', 'nature', 'Đặc điểm thời tiết', 'Đặc điểm thời tiết', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l7', 'nature', 'Nguyên tố tự nhiên', 'Nguyên tố tự nhiên', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l8', 'nature', 'Hiện tượng thiên nhiên', 'Hiện tượng thiên nhiên', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l9', 'nature', 'Không gian dã ngoại', 'Không gian dã ngoại', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('nature_l10', 'nature', 'Bảo vệ hành tinh xanh', 'Bảo vệ hành tinh xanh', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l1', 'vehicles', 'Phương tiện đường bộ', 'Phương tiện đường bộ', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l2', 'vehicles', 'Xe đường sắt & công trình', 'Xe đường sắt & công trình', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l3', 'vehicles', 'Phương tiện bay trên trời', 'Phương tiện bay trên trời', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l4', 'vehicles', 'Phương tiện đường thủy', 'Phương tiện đường thủy', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l5', 'vehicles', 'Xe hai bánh & đồ chơi lăn', 'Xe hai bánh & đồ chơi lăn', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l6', 'vehicles', 'Các bộ phận của xe', 'Các bộ phận của xe', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l7', 'vehicles', 'Giao thông đường phố', 'Giao thông đường phố', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l8', 'vehicles', 'Hành động di chuyển', 'Hành động di chuyển', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l9', 'vehicles', 'Bến bãi & Trạm dừng', 'Bến bãi & Trạm dừng', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('vehicles_l10', 'vehicles', 'Quy tắc an toàn giao thông', 'Quy tắc an toàn giao thông', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l1', 'clothing', 'Quần áo mặc hàng ngày', 'Quần áo mặc hàng ngày', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l2', 'clothing', 'Giày dép & Đồ ngủ', 'Giày dép & Đồ ngủ', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l3', 'clothing', 'Phụ kiện thời trang', 'Phụ kiện thời trang', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l4', 'clothing', 'Đồ ấm mùa đông & che mưa', 'Đồ ấm mùa đông & che mưa', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l5', 'clothing', 'Trang phục mùa hè & đi biển', 'Trang phục mùa hè & đi biển', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l6', 'clothing', 'Đồng phục trường & Lễ hội', 'Đồng phục trường & Lễ hội', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l7', 'clothing', 'Hành động với trang phục', 'Hành động với trang phục', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l8', 'clothing', 'Chất liệu & Họa tiết', 'Chất liệu & Họa tiết', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l9', 'clothing', 'Kích cỡ & Kiểu dáng', 'Kích cỡ & Kiểu dáng', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('clothing_l10', 'clothing', 'Trang sức & Đồ hóa trang', 'Trang sức & Đồ hóa trang', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l1', 'feelings', 'Cảm xúc cơ bản', 'Cảm xúc cơ bản', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l2', 'feelings', 'Cảm xúc hân hoan', 'Cảm xúc hân hoan', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l3', 'feelings', 'Tâm hồn bình yên', 'Tâm hồn bình yên', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l4', 'feelings', 'Vượt qua nỗi buồn bực', 'Vượt qua nỗi buồn bực', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l5', 'feelings', 'Dũng cảm & Mạnh mẽ', 'Dũng cảm & Mạnh mẽ', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l6', 'feelings', 'Lòng nhân ái & Sẻ chia', 'Lòng nhân ái & Sẻ chia', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l7', 'feelings', 'Biểu lộ cảm xúc', 'Biểu lộ cảm xúc', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l8', 'feelings', 'Tò mò & Khám phá', 'Tò mò & Khám phá', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l9', 'feelings', 'Tình bạn bè thân thiết', 'Tình bạn bè thân thiết', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('feelings_l10', 'feelings', 'Làm dịu cảm xúc & Bình an', 'Làm dịu cảm xúc & Bình an', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l1', 'actions', 'Vận động & Chạy nhảy', 'Vận động & Chạy nhảy', 1, 'beginner', 1, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l2', 'actions', 'Cử động đôi tay khéo léo', 'Cử động đôi tay khéo léo', 2, 'beginner', 2, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l3', 'actions', 'Tập thể thao vui khỏe', 'Tập thể thao vui khỏe', 3, 'beginner', 3, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l4', 'actions', 'Hoạt động thường nhật', 'Hoạt động thường nhật', 4, 'beginner', 4, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l5', 'actions', 'Giao tiếp & Nói cười', 'Giao tiếp & Nói cười', 5, 'beginner', 5, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l6', 'actions', 'Học tập & Tư duy', 'Học tập & Tư duy', 6, 'beginner', 6, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l7', 'actions', 'Giúp đỡ & Yêu thương', 'Giúp đỡ & Yêu thương', 7, 'beginner', 7, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l8', 'actions', 'Sáng tạo nghệ thuật', 'Sáng tạo nghệ thuật', 8, 'beginner', 8, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l9', 'actions', 'Khám phá ngoài trời', 'Khám phá ngoài trời', 9, 'beginner', 9, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;
INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES ('actions_l10', 'actions', 'Thói quen tốt của bé', 'Thói quen tốt của bé', 10, 'beginner', 10, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;

-- 3. SEED 1.200 VOCABULARY WORDS
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w01_cat', 'animals_l1', 'cat', 'con mèo', '/kæt/', 'The cat is sleeping.', 'Con mèo đang ngủ.', 'pawprint.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w02_dog', 'animals_l1', 'dog', 'con chó', '/dɒɡ/', 'The dog wags its tail.', 'Con chó vẫy đuôi.', 'pawprint.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w03_fish', 'animals_l1', 'fish', 'con cá', '/fɪʃ/', 'The fish swims fast.', 'Con cá bơi rất nhanh.', 'fish.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w04_bird', 'animals_l1', 'bird', 'con chim', '/bɜːd/', 'The bird can sing.', 'Con chim biết hót.', 'bird.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w05_rabbit', 'animals_l1', 'rabbit', 'con thỏ', '/ˈræb.ɪt/', 'The rabbit loves carrots.', 'Con thỏ thích cà rốt.', 'hare.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w06_hamster', 'animals_l1', 'hamster', 'chuột hamster', '/ˈhæm.stər/', 'The hamster runs on the wheel.', 'Chuột hamster chạy trên bánh xe.', 'circle.circle', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w07_parrot', 'animals_l1', 'parrot', 'con vẹt', '/ˈpær.ət/', 'The parrot has colorful feathers.', 'Con vẹt có bộ lông sặc sỡ.', 'bird.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w08_turtle', 'animals_l1', 'turtle', 'con rùa', '/ˈtɜː.təl/', 'The turtle walks slowly.', 'Con rùa đi chậm rãi.', 'shield.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w09_puppy', 'animals_l1', 'puppy', 'chó con', '/ˈpʌp.i/', 'The puppy is so cute.', 'Chú chó con thật dễ thương.', 'pawprint.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l01_w10_kitten', 'animals_l1', 'kitten', 'mèo con', '/ˈkɪt.ən/', 'The kitten drinks milk.', 'Mèo con uống sữa.', 'pawprint.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w01_cow', 'animals_l2', 'cow', 'con bò', '/kaʊ/', 'The cow gives milk.', 'Con bò cho sữa tươi.', 'pawprint.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w02_horse', 'animals_l2', 'horse', 'con ngựa', '/hɔːs/', 'The horse runs in the field.', 'Con ngựa phi trên cánh đồng.', 'figure.equestrian.sports', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w03_pig', 'animals_l2', 'pig', 'con lợn', '/pɪɡ/', 'The pig likes playing in mud.', 'Con lợn thích nghịch bùn.', 'oval.portrait.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w04_sheep', 'animals_l2', 'sheep', 'con cừu', '/ʃiːp/', 'The sheep has warm white wool.', 'Con cừu có bộ lông ấm áp.', 'cloud.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w05_duck', 'animals_l2', 'duck', 'con vịt', '/dʌk/', 'The duck swims in the pond.', 'Con vịt bơi dưới ao.', 'water.waves', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w06_chicken', 'animals_l2', 'chicken', 'con gà', '/ˈtʃɪk.ɪn/', 'The chicken pecks the corn.', 'Con gà mổ ngô.', 'circle.grid.2x2.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w07_goat', 'animals_l2', 'goat', 'con dê', '/ɡəʊt/', 'The goat eats green grass.', 'Con dê ăn cỏ xanh.', 'leaf.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w08_rooster', 'animals_l2', 'rooster', 'gà trống', '/ˈruː.stər/', 'The rooster crows every morning.', 'Gà trống gáy mỗi sáng.', 'sun.max.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w09_donkey', 'animals_l2', 'donkey', 'con lừa', '/ˈdɒŋ.ki/', 'The donkey carries the bags.', 'Con lừa thồ túi hàng.', 'bag.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l02_w10_goose', 'animals_l2', 'goose', 'con ngỗng', '/ɡuːs/', 'The goose has a long neck.', 'Con ngỗng có chiếc cổ dài.', 'bird.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w01_lion', 'animals_l3', 'lion', 'sư tử', '/ˈlaɪ.ən/', 'The lion is the king of the jungle.', 'Sư tử là chúa sơn lâm.', 'crown.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w02_tiger', 'animals_l3', 'tiger', 'con hổ', '/ˈtaɪ.ɡər/', 'The tiger has orange and black stripes.', 'Con hổ có vằn cam đen.', 'flame.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w03_elephant', 'animals_l3', 'elephant', 'con voi', '/ˈel.ɪ.fənt/', 'The elephant has a long trunk.', 'Con voi có chiếc vòi dài.', 'camera.macro', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w04_monkey', 'animals_l3', 'monkey', 'con khỉ', '/ˈmʌŋ.ki/', 'The monkey swings on the tree.', 'Con khỉ đu đưa trên cây.', 'tree.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w05_bear', 'animals_l3', 'bear', 'con gấu', '/beər/', 'The bear loves sweet honey.', 'Con gấu thích mật ong ngọt ngào.', 'heart.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w06_giraffe', 'animals_l3', 'giraffe', 'hươu cao cổ', '/dʒɪˈrɑːf/', 'The giraffe is very tall.', 'Hươu cao cổ rất cao.', 'arrow.up.circle.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w07_zebra', 'animals_l3', 'zebra', 'ngựa vằn', '/ˈzeb.rə/', 'The zebra has black and white stripes.', 'Ngựa vằn có sọc đen trắng.', 'square.split.diagonal.2x2', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w08_kangaroo', 'animals_l3', 'kangaroo', 'chuột túi', '/ˌkæŋ.ɡərˈuː/', 'The kangaroo hops very high.', 'Chuột túi nhảy rất cao.', 'figure.run', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w09_panda', 'animals_l3', 'panda', 'gấu trúc', '/ˈpæn.də/', 'The panda eats green bamboo.', 'Gấu trúc ăn lá tre xanh.', 'leaf.circle.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l03_w10_hippo', 'animals_l3', 'hippo', 'hà mã', '/ˈhɪp.əʊ/', 'The hippo bathes in the river.', 'Hà mã tắm dưới dòng sông.', 'drop.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w01_whale', 'animals_l4', 'whale', 'cá voi', '/weɪl/', 'The whale is huge and gentle.', 'Cá voi khổng lồ và hiền lành.', 'water.waves', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w02_dolphin', 'animals_l4', 'dolphin', 'cá heo', '/ˈdɒl.fɪn/', 'The dolphin jumps out of water.', 'Cá heo nhảy lên khỏi mặt nước.', 'sparkles', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w03_shark', 'animals_l4', 'shark', 'cá mập', '/ʃɑːk/', 'The shark swims deep in the ocean.', 'Cá mập bơi sâu dưới đại dương.', 'shield.slash.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w04_octopus', 'animals_l4', 'octopus', 'bạch tuộc', '/ˈɒk.tə.pəs/', 'The octopus has eight arms.', 'Bạch tuộc có tám xúc tu.', 'hand.raised.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w05_crab', 'animals_l4', 'crab', 'con cua', '/kræb/', 'The crab walks sideways on the sand.', 'Con cua bò ngang trên bãi cát.', 'scissors', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w06_shrimp', 'animals_l4', 'shrimp', 'con tôm', '/ʃrɪmp/', 'The shrimp swims in the sea.', 'Con tôm bơi trong làn nước biển.', 'fish.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w07_jellyfish', 'animals_l4', 'jellyfish', 'con sứa', '/ˈdʒel.i.fɪʃ/', 'The jellyfish glows in the dark.', 'Con sứa phát sáng trong bóng tối.', 'lightbulb.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w08_seahorse', 'animals_l4', 'seahorse', 'cá ngựa', '/ˈsiː.hɔːs/', 'The seahorse has a curly tail.', 'Cá ngựa có chiếc đuôi uốn cong.', 'curlybraces', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w09_seal', 'animals_l4', 'seal', 'hải cẩu', '/siːl/', 'The seal claps its flippers.', 'Hải cẩu vỗ vây tán thưởng.', 'hands.clap.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l04_w10_starfish', 'animals_l4', 'starfish', 'sao biển', '/ˈstɑː.fɪʃ/', 'The starfish rests on the reef.', 'Sao biển nằm trên rạn san hô.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w01_owl', 'animals_l5', 'owl', 'cú mèo', '/aʊl/', 'The owl opens big eyes at night.', 'Cú mèo mở to mắt vào ban đêm.', 'moon.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w02_eagle', 'animals_l5', 'eagle', 'đại bàng', '/ˈiː.ɡəl/', 'The eagle flies high in the sky.', 'Đại bàng bay lượn trên trời cao.', 'wind', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w03_penguin', 'animals_l5', 'penguin', 'chim cánh cụt', '/ˈpeŋ.ɡwɪn/', 'The penguin waddles on ice.', 'Chim cánh cụt lạch bạch trên băng.', 'snowflake', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w04_flamingo', 'animals_l5', 'flamingo', 'hồng hạc', '/fləˈmɪŋ.ɡəʊ/', 'The flamingo stands on one pink leg.', 'Hồng hạc đứng bằng một chân hồng.', 'figure.stand', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w05_swan', 'animals_l5', 'swan', 'thiên nga', '/swɒn/', 'The swan glides gracefully on the lake.', 'Thiên nga lướt nhẹ nhàng trên hồ.', 'heart.circle.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w06_peacock', 'animals_l5', 'peacock', 'con công', '/ˈpiː.kɒk/', 'The peacock spreads its amazing tail.', 'Con công xòe chiếc đuôi lộng lẫy.', 'sparkle', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w07_woodpecker', 'animals_l5', 'woodpecker', 'chim gõ kiến', '/ˈwʊdˌpek.ər/', 'The woodpecker taps on the tree.', 'Chim gõ kiến gõ lách cách trên thân cây.', 'hammer.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w08_sparrow', 'animals_l5', 'sparrow', 'chim sẻ', '/ˈspær.əʊ/', 'The little sparrow chirps happily.', 'Chú chim sẻ ríu rít vui vẻ.', 'music.note', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w09_crow', 'animals_l5', 'crow', 'con quạ', '/krəʊ/', 'The black crow is very clever.', 'Con quạ đen rất thông minh.', 'brain.head.profile', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l05_w10_pigeon', 'animals_l5', 'pigeon', 'bồ câu', '/ˈpɪdʒ.ən/', 'The white pigeon brings peace.', 'Bồ câu trắng mang lại hòa bình.', 'bird.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w01_butterfly', 'animals_l6', 'butterfly', 'con bướm', '/ˈbʌt.ə.flaɪ/', 'The butterfly lands on the flower.', 'Con bướm đậu trên bông hoa.', 'camera.macro', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w02_bee', 'animals_l6', 'bee', 'con ong', '/biː/', 'The busy bee makes sweet honey.', 'Chú ong chăm chỉ làm mật ngọt.', 'hexagon.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w03_ant', 'animals_l6', 'ant', 'con kiến', '/ænt/', 'The tiny ant works together.', 'Chú kiến nhỏ bé cùng nhau làm việc.', 'person.3.sequence.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w04_ladybug', 'animals_l6', 'ladybug', 'bọ rùa', '/ˈleɪ.di.bɜːd/', 'The ladybug has red wings with black dots.', 'Bọ rùa có cánh đỏ với chấm đen.', 'circle.grid.3x3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w05_dragonfly', 'animals_l6', 'dragonfly', 'chuồn chuồn', '/ˈdræɡ.ən.flaɪ/', 'The dragonfly flies near the river.', 'Chuồn chuồn bay gần bờ sông.', 'airplane', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w06_snail', 'animals_l6', 'snail', 'ốc sên', '/sneɪl/', 'The snail carries its little shell.', 'Ốc sên mang trên mình chiếc vỏ nhỏ.', 'shield.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w07_spider', 'animals_l6', 'spider', 'con nhện', '/ˈspaɪ.dər/', 'The spider weaves a beautiful web.', 'Con nhện giăng một mạng lưới tuyệt đẹp.', 'network', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w08_grasshopper', 'animals_l6', 'grasshopper', 'châu chấu', '/ˈɡrɑːsˌhɒp.ər/', 'The grasshopper jumps across the meadow.', 'Châu chấu nhảy qua đồng cỏ.', 'figure.jumprope', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w09_caterpillar', 'animals_l6', 'caterpillar', 'sâu bướm', '/ˈkæt.ə.pɪl.ər/', 'The caterpillar turns into a butterfly.', 'Sâu bướm hóa thành chú bướm xinh.', 'arrow.triangle.2.circlepath', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l06_w10_firefly', 'animals_l6', 'firefly', 'đom đóm', '/ˈfaɪə.flaɪ/', 'The firefly shines bright at night.', 'Đom đóm tỏa sáng lung linh trong đêm.', 'lightbulb.max.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w01_fox', 'animals_l7', 'fox', 'con cáo', '/fɒks/', 'The clever fox has a bushy tail.', 'Con cáo lanh lợi có chiếc đuôi rậm.', 'flame.circle.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w02_wolf', 'animals_l7', 'wolf', 'chó sói', '/wʊlf/', 'The wolf howls at the full moon.', 'Chó sói hú dưới ánh trăng tròn.', 'moon.stars.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w03_deer', 'animals_l7', 'deer', 'con hươu', '/dɪər/', 'The gentle deer leaps through the trees.', 'Chú hươu hiền lành nhảy qua hàng cây.', 'leaf.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w04_squirrel', 'animals_l7', 'squirrel', 'con sóc', '/ˈskwɪr.əl/', 'The squirrel gathers crunchy acorns.', 'Con sóc nhặt những quả sồi giòn.', 'circle.grid.cross.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w05_hedgehog', 'animals_l7', 'hedgehog', 'con nhím', '/ˈhedʒ.hɒɡ/', 'The hedgehog rolls into a spiky ball.', 'Con nhím cuộn tròn thành quả bóng gai.', 'shield.checkerboard', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w06_raccoon', 'animals_l7', 'raccoon', 'gấu mèo', '/rækˈuːn/', 'The raccoon washes its food.', 'Gấu mèo rửa thức ăn trước khi ăn.', 'hands.sparkles.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w07_beaver', 'animals_l7', 'beaver', 'hải ly', '/ˈbiː.vər/', 'The beaver builds a wooden dam.', 'Hải ly xây đập ngăn nước bằng gỗ.', 'hammer.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w08_skunk', 'animals_l7', 'skunk', 'chồn hôi', '/skʌŋk/', 'The skunk has a white stripe.', 'Chồn hôi có vệt lông màu trắng.', 'line.diagonal', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w09_badger', 'animals_l7', 'badger', 'con lửng', '/ˈbædʒ.ər/', 'The badger digs deep burrows.', 'Con lửng đào hang sâu trong lòng đất.', 'arrow.down.circle.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l07_w10_moose', 'animals_l7', 'moose', 'nai sừng tấm', '/muːs/', 'The moose has magnificent antlers.', 'Nai sừng tấm có cặp gạc hùng vĩ.', 'crown.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w01_frog', 'animals_l8', 'frog', 'con ếch', '/frɒɡ/', 'The green frog croaks and jumps.', 'Chú ếch xanh kêu ồm ộp và nhảy xa.', 'water.waves', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w02_snake', 'animals_l8', 'snake', 'con rắn', '/sneɪk/', 'The snake glides silently on the ground.', 'Con rắn trườn êm đềm trên mặt đất.', 'scribble', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w03_crocodile', 'animals_l8', 'crocodile', 'cá sấu', '/ˈkrɒk.ə.daɪl/', 'The crocodile basks under warm sun.', 'Cá sấu phơi mình dưới ánh nắng ấm.', 'sun.max.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w04_lizard', 'animals_l8', 'lizard', 'thằn lằn', '/ˈlɪz.əd/', 'The lizard rests on the warm rock.', 'Thằn lằn nghỉ ngơi trên phiến đá ấm.', 'square.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w05_chameleon', 'animals_l8', 'chameleon', 'tắc kè hoa', '/kəˈmiː.li.ən/', 'The chameleon changes its skin color.', 'Tắc kè hoa đổi màu sắc da kỳ diệu.', 'paintpalette.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w06_toad', 'animals_l8', 'toad', 'con cóc', '/təʊd/', 'The toad catches a bug with its tongue.', 'Con cóc bắt bọ bằng chiếc lưỡi nhanh.', 'circle.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w07_gecko', 'animals_l8', 'gecko', 'tắc kè', '/ˈɡek.əʊ/', 'The gecko climbs smooth glass walls.', 'Tắc kè leo trèo trên tường kính trơn.', 'hand.raised.fingers.spread.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w08_alligator', 'animals_l8', 'alligator', 'cá sấu Mỹ', '/ˈæl.ɪ.ɡeɪ.tər/', 'The alligator swims along the swamp.', 'Cá sấu bơi dọc đầm lầy.', 'drop.triangle.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w09_iguana', 'animals_l8', 'iguana', 'kỳ nhông', '/ɪˈɡwɑː.nə/', 'The green iguana loves warm sunshine.', 'Kỳ nhông xanh thích ánh nắng ấm áp.', 'sun.haze.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l08_w10_newt', 'animals_l8', 'newt', 'sa giông', '/njuːt/', 'The tiny newt swims in the clear pond.', 'Sa giông nhỏ bé bơi trong ao trong veo.', 'water.waves.and.arrow.down', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w01_polar_bear', 'animals_l9', 'polar bear', 'gấu bắc cực', '/ˈpəʊ.lər beər/', 'The polar bear walks on white ice.', 'Gấu bắc cực bước đi trên băng tuyết.', 'snowflake', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w02_walrus', 'animals_l9', 'walrus', 'hải mã', '/ˈwɔːl.rəs/', 'The walrus has two long tusks.', 'Hải mã có hai chiếc ngà dài.', 'shield.lefthalf.filled', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w03_camel', 'animals_l9', 'camel', 'lạc đà', '/ˈkæm.əl/', 'The camel travels across desert sand.', 'Lạc đà đi băng qua sa mạc cát.', 'sun.max.trianglebadge.exclamationmark', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w04_cheetah', 'animals_l9', 'cheetah', 'báo săn', '/ˈtʃiː.tə/', 'The cheetah is the fastest animal.', 'Báo săn là loài động vật chạy nhanh nhất.', 'bolt.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w05_leopard', 'animals_l9', 'leopard', 'báo hoa mai', '/ˈlep.əd/', 'The leopard climbs high up the tree.', 'Báo hoa mai leo trèo lên ngọn cây cao.', 'tree.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w06_ostrich', 'animals_l9', 'ostrich', 'đà điểu', '/ˈɒs.trɪtʃ/', 'The ostrich has very strong legs.', 'Đà điểu có đôi chân rất khỏe khoắn.', 'figure.run', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w07_hyena', 'animals_l9', 'hyena', 'linh cẩu', '/haɪˈiː.nə/', 'The hyena lives in a big group.', 'Linh cẩu sống thành đàn đông đúc.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w08_scorpion', 'animals_l9', 'scorpion', 'bọ cạp', '/ˈskɔː.pi.ən/', 'The scorpion hides under desert stones.', 'Bọ cạp ẩn nấp dưới những viên đá sa mạc.', 'exclamationmark.shield.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w09_meerkat', 'animals_l9', 'meerkat', 'chồn đất', '/ˈmɪə.kæt/', 'The meerkat stands tall on lookout.', 'Chồn đất đứng thẳng canh gác cho cả đàn.', 'eye.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l09_w10_coyote', 'animals_l9', 'coyote', 'chó sói đồng cỏ', '/kaɪˈəʊ.ti/', 'The coyote trots across the dry plains.', 'Chó sói đồng cỏ chạy qua bình nguyên khô.', 'wind', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w01_fur', 'animals_l10', 'fur', 'lông thú', '/fɜːr/', 'The rabbit has soft and fluffy fur.', 'Con thỏ có bộ lông mềm mại bồng bềnh.', 'sparkles', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w02_tail', 'animals_l10', 'tail', 'cái đuôi', '/teɪl/', 'The puppy wags its happy tail.', 'Chú cún vui vẻ vẫy chiếc đuôi xinh.', 'scribble', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w03_wing', 'animals_l10', 'wing', 'đôi cánh', '/wɪŋ/', 'The bird flaps its wings to fly.', 'Con chim vỗ đôi cánh để bay lượn.', 'wind', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w04_feather', 'animals_l10', 'feather', 'lông vũ', '/ˈfeð.ər/', 'The feather is light and colorful.', 'Chiếc lông vũ nhẹ tênh và nhiều màu.', 'leaf.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w05_paw', 'animals_l10', 'paw', 'bàn chân thú', '/pɔː/', 'The cat leaves tiny paw prints.', 'Mèo con để lại những dấu chân nhỏ xinh.', 'pawprint.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w06_claw', 'animals_l10', 'claw', 'móng vuốt', '/klɔː/', 'The eagle has sharp claws to grip.', 'Đại bàng có móng vuốt sắc nhọn.', 'scissors', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w07_beak', 'animals_l10', 'beak', 'mỏ chim', '/biːk/', 'The parrot uses its beak to eat seeds.', 'Con vẹt dùng mỏ để ăn hạt ngũ cốc.', 'triangle.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w08_horn', 'animals_l10', 'horn', 'sừng', '/hɔːn/', 'The deer has beautiful horns.', 'Con hươu có cặp sừng tuyệt đẹp.', 'crown.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w09_fin', 'animals_l10', 'fin', 'vây cá', '/fɪn/', 'The fish moves its fin to turn.', 'Con cá vẫy chiếc vây để đổi hướng bơi.', 'fish.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('animals_l10_w10_shell', 'animals_l10', 'shell', 'mai rùa / vỏ sò', '/ʃel/', 'The turtle hides safe inside its shell.', 'Con rùa trốn an toàn trong chiếc mai cứng.', 'shield.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w01_red', 'colors_l1', 'red', 'màu đỏ', '/red/', 'The juicy apple is red.', 'Quả táo mọng nước có màu đỏ.', 'circle.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w02_blue', 'colors_l1', 'blue', 'màu xanh dương', '/bluː/', 'The ocean is deep blue.', 'Đại dương có màu xanh dương thẳm.', 'circle.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w03_yellow', 'colors_l1', 'yellow', 'màu vàng', '/ˈjel.əʊ/', 'The warm sun is yellow.', 'Mặt trời ấm áp có màu vàng rực.', 'sun.max.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w04_green', 'colors_l1', 'green', 'màu xanh lá', '/ɡriːn/', 'The fresh grass is bright green.', 'Cỏ tươi có màu xanh lá cây mát mắt.', 'leaf.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w05_orange', 'colors_l1', 'orange', 'màu cam', '/ˈɒr.ɪndʒ/', 'The sweet carrot is orange.', 'Củ cà rốt ngọt có màu cam.', 'circle.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w06_purple', 'colors_l1', 'purple', 'màu tím', '/ˈpɜː.pəl/', 'The sweet grape is purple.', 'Quả nho ngọt có màu tím biếc.', 'circle.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w07_pink', 'colors_l1', 'pink', 'màu hồng', '/pɪŋk/', 'The pretty flower is pink.', 'Bông hoa xinh xắn có màu hồng.', 'heart.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w08_brown', 'colors_l1', 'brown', 'màu nâu', '/braʊn/', 'The cute teddy bear is brown.', 'Chú gấu bông dễ thương có màu nâu.', 'circle.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w09_black', 'colors_l1', 'black', 'màu đen', '/blæk/', 'The shiny night sky is black.', 'Bầu trời đêm lấp lánh có màu đen.', 'moon.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l01_w10_white', 'colors_l1', 'white', 'màu trắng', '/waɪt/', 'The soft cloud is pure white.', 'Đám mây êm đềm có màu trắng tinh.', 'cloud.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w01_gray', 'colors_l2', 'gray', 'màu xám', '/ɡreɪ/', 'The gentle elephant is gray.', 'Chú voi hiền lành có màu xám.', 'circle.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w02_violet', 'colors_l2', 'violet', 'màu tím hoa cà', '/ˈvaɪə.lət/', 'The sweet violet blossoms in spring.', 'Hoa violet nở rộ vào mùa xuân.', 'camera.macro', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w03_indigo', 'colors_l2', 'indigo', 'màu chàm', '/ˈɪn.dɪ.ɡəʊ/', 'Indigo is one color of the rainbow.', 'Màu chàm là một sắc của cầu vồng.', 'sparkles', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w04_gold', 'colors_l2', 'gold', 'màu vàng kim', '/ɡəʊld/', 'The champion medal is shiny gold.', 'Tấm huy chương vô địch sáng màu vàng kim.', 'medal.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w05_silver', 'colors_l2', 'silver', 'màu ánh bạc', '/ˈsɪl.vər/', 'The quiet moon shines like silver.', 'Vầng trăng dịu êm tỏa ánh sáng bạc.', 'moon.stars.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w06_beige', 'colors_l2', 'beige', 'màu be', '/beɪʒ/', 'The warm sand on beach is beige.', 'Cát ấm trên bờ biển có màu be.', 'circle.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w07_cream', 'colors_l2', 'cream', 'màu kem', '/kriːm/', 'The sweet dessert is soft cream color.', 'Món tráng miệng có màu kem ngọt ngào.', 'cup.and.saucer.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w08_peach', 'colors_l2', 'peach', 'màu quả đào', '/piːtʃ/', 'Her dress has a lovely peach color.', 'Chiếc váy của bé có màu quả đào đáng yêu.', 'heart.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w09_lavender', 'colors_l2', 'lavender', 'màu oải hương', '/ˈlæv.ɪn.dər/', 'Lavender fields smell very sweet.', 'Cánh đồng hoa oải hương thơm dịu ngọt.', 'leaf.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l02_w10_mint', 'colors_l2', 'mint', 'màu xanh bạc hà', '/mɪnt/', 'Dino has a cool mint-green color.', 'Khủng long Dino có màu xanh bạc hà mát lành.', 'sparkle', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w01_light_blue', 'colors_l3', 'light blue', 'màu xanh da trời', '/laɪt bluː/', 'The morning sky is clear light blue.', 'Bầu trời buổi sáng xanh ngắt nhẹ nhàng.', 'sun.max.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w02_dark_green', 'colors_l3', 'dark green', 'màu xanh lá đậm', '/dɑːk ɡriːn/', 'Pine needles are dark green.', 'Lá thông kim có màu xanh đậm kiên cường.', 'tree.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w03_bright_yellow', 'colors_l3', 'bright yellow', 'màu vàng tươi', '/braɪt ˈjel.əʊ/', 'Sunflower has bright yellow petals.', 'Hoa hướng dương có những cánh vàng tươi.', 'sun.max.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w04_pale_pink', 'colors_l3', 'pale pink', 'màu hồng phấn', '/peɪl pɪŋk/', 'Cherry blossom has pale pink flowers.', 'Hoa anh đào có những bông hồng phấn dịu dàng.', 'heart.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w05_navy_blue', 'colors_l3', 'navy blue', 'màu xanh hải quân', '/ˈneɪ.vi bluː/', 'His school jacket is navy blue.', 'Áo khoác đi học của bé màu xanh hải quân.', 'tshirt.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w06_ruby_red', 'colors_l3', 'ruby red', 'màu đỏ ruby', '/ˈruː.bi red/', 'The precious gem shines ruby red.', 'Viên ngọc quý tỏa ánh đỏ ruby lấp lánh.', 'sparkles', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w07_emerald', 'colors_l3', 'emerald', 'màu ngọc lục bảo', '/ˈem.ər.əld/', 'The queen ring has an emerald stone.', 'Chiếc nhẫn đính viên ngọc lục bảo xanh biếc.', 'diamond.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w08_charcoal', 'colors_l3', 'charcoal', 'màu xám than', '/ˈtʃɑː.kəʊl/', 'The artist draws with charcoal gray.', 'Họa sĩ vẽ tranh bằng màu xám than.', 'pencil.tip', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w09_maroon', 'colors_l3', 'maroon', 'màu đỏ bầm', '/məˈruːn/', 'The cozy blanket is rich maroon.', 'Chiếc chăn ấm áp có màu đỏ bầm sang trọng.', 'bed.double.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l03_w10_olive', 'colors_l3', 'olive', 'màu xanh ô liu', '/ˈɒl.ɪv/', 'The olive tree leaf is olive green.', 'Lá cây ô liu có màu xanh đặc trưng.', 'leaf.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w01_sky_blue', 'colors_l4', 'sky blue', 'xanh da trời', '/skaɪ bluː/', 'Birds fly in the sky blue air.', 'Những chú chim bay trên nền trời xanh biếc.', 'cloud.sun.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w02_grass_green', 'colors_l4', 'grass green', 'xanh cỏ non', '/ɡrɑːs ɡriːn/', 'We run on the grass green lawn.', 'Bé tung tăng chạy trên bãi cỏ non xanh rờn.', 'leaf.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w03_ocean_blue', 'colors_l4', 'ocean blue', 'xanh đại dương', '/ˈəʊ.ʃən bluː/', 'Whales swim in ocean blue water.', 'Cá voi bơi lội trong làn nước biển xanh thẳm.', 'water.waves', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w04_sunset_orange', 'colors_l4', 'sunset orange', 'cam hoàng hôn', '/ˈsʌn.set ˈɒr.ɪndʒ/', 'The evening sky is sunset orange.', 'Bầu trời chiều tà nhuốm sắc cam hoàng hôn.', 'sunset.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w05_rose_red', 'colors_l4', 'rose red', 'đỏ hoa hồng', '/rəʊz red/', 'Garden blooms with rose red beauty.', 'Khu vườn bừng nở sắc đỏ hoa hồng rực rỡ.', 'camera.macro', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w06_sandy_brown', 'colors_l4', 'sandy brown', 'nâu cát biển', '/ˈsæn.di braʊn/', 'We build castles of sandy brown sand.', 'Bé xây lâu đài từ cát biển màu nâu ấm.', 'building.columns.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w07_snow_white', 'colors_l4', 'snow white', 'trắng tuyết', '/snəʊ waɪt/', 'Winter blankets the hill in snow white.', 'Mùa đông phủ lên sườn đồi tấm chăn trắng tuyết.', 'snowflake', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w08_leaf_green', 'colors_l4', 'leaf green', 'xanh lá cây', '/liːf ɡriːn/', 'Fresh sprout shows bright leaf green.', 'Mầm non mới nhú mang sắc xanh nõn nà.', 'leaf.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w09_mud_brown', 'colors_l4', 'mud brown', 'nâu đất', '/mʌd braʊn/', 'The country road has mud brown soil.', 'Con đường quê mộc mạc mang màu nâu đất.', 'road.lanes', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l04_w10_sunshine_yellow', 'colors_l4', 'sunshine yellow', 'vàng nắng ấm', '/ˈsʌn.ʃaɪn ˈjel.əʊ/', 'Morning smiles with sunshine yellow.', 'Buổi sớm mỉm cười với sắc vàng rực của nắng.', 'sun.max.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w01_spotted', 'colors_l5', 'spotted', 'lốm đốm', '/ˈspɒt.ɪd/', 'The cheetah has spotted fur.', 'Báo săn có bộ lông lốm đốm đặc trưng.', 'circle.grid.3x3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w02_striped', 'colors_l5', 'striped', 'kẻ sọc', '/straɪpt/', 'The tiger is boldly striped.', 'Chú hổ khoác lên mình lớp áo vằn dũng mãnh.', 'line.horizontal.3', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w03_golden', 'colors_l5', 'golden', 'óng ánh vàng', '/ˈɡəʊl.dən/', 'The lion has a golden mane.', 'Sư tử sở hữu chiếc bờm óng ánh sắc vàng.', 'sun.max.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w04_snowy', 'colors_l5', 'snowy', 'trắng như tuyết', '/ˈsnəʊ.i/', 'The snowy owl flies quietly.', 'Cú tuyết bay lượn êm ru trong không gian.', 'snowflake', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w05_rusty', 'colors_l5', 'rusty', 'màu rỉ sét', '/ˈrʌs.ti/', 'The fox has rusty red fur.', 'Chú cáo có bộ lông màu đỏ rỉ ấm áp.', 'flame.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w06_bronze', 'colors_l5', 'bronze', 'màu đồng thiếc', '/brɒnz/', 'The beetle shines like bronze.', 'Chú bọ cánh cứng sáng loáng như đồng.', 'shield.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w07_copper', 'colors_l5', 'copper', 'màu đồng đỏ', '/ˈkɒp.ər/', 'Autumn leaves turn copper red.', 'Lá thu chuyển sang màu đồng đỏ quyến rũ.', 'leaf.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w08_amber', 'colors_l5', 'amber', 'màu hổ phách', '/ˈæm.bər/', 'Cat eyes glow like warm amber.', 'Đôi mắt mèo sáng rực như viên ngọc hổ phách.', 'eye.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w09_tan', 'colors_l5', 'tan', 'màu da rám nắng', '/tæn/', 'The deer has a soft tan coat.', 'Con hươu có bộ lông màu da mịn màng.', 'pawprint.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l05_w10_raven', 'colors_l5', 'raven', 'đen tuyền', '/ˈreɪ.vən/', 'The crow has raven black feathers.', 'Con quạ sở hữu bộ lông vũ đen tuyền huyền bí.', 'bird.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w01_chocolate_brown', 'colors_l6', 'chocolate brown', 'nâu sô-cô-la', '/ˈtʃɒk.lət braʊn/', 'Cake is frosted chocolate brown.', 'Bánh kem phủ lớp sô-cô-la nâu ngọt ngào.', 'cup.and.saucer.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w02_strawberry_red', 'colors_l6', 'strawberry red', 'đỏ dâu tây', '/ˈstrɔː.bər.i red/', 'Ice cream is sweet strawberry red.', 'Kem que mang sắc đỏ dâu tây thơm ngon.', 'heart.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w03_banana_yellow', 'colors_l6', 'banana yellow', 'vàng chuối chín', '/bəˈnɑː.nə ˈjel.əʊ/', 'The fruit bowl has banana yellow peel.', 'Tô trái cây có vỏ chuối vàng ươm hấp dẫn.', 'sun.max.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w04_lime_green', 'colors_l6', 'lime green', 'xanh chanh tươi', '/laɪm ɡriːn/', 'Summer drink is bright lime green.', 'Thức uống giải khát mùa hè xanh vị chanh tươi.', 'leaf.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w05_orange_orange', 'colors_l6', 'orange orange', 'cam mọng', '/ˈɒr.ɪndʒ ˈɒr.ɪndʒ/', 'Juice glows orange orange sweet.', 'Ly nước cam óng ánh sắc cam mọng nước.', 'drop.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w06_blueberry', 'colors_l6', 'blueberry', 'tím việt quất', '/ˈbluː.bər.i/', 'The muffin has blueberry treats.', 'Bánh xốp điểm những viên việt quất tím ngọt.', 'circle.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w07_cherry_red', 'colors_l6', 'cherry red', 'đỏ anh đào', '/ˈtʃer.i red/', 'Lollipop is shiny cherry red.', 'Kẹo mút có sắc đỏ anh đào bóng bẩy.', 'heart.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w08_honey_yellow', 'colors_l6', 'honey yellow', 'vàng mật ong', '/ˈhʌn.i ˈjel.əʊ/', 'Sweet waffle needs honey yellow drip.', 'Bánh quế ngọt ngào chan mật ong vàng sánh.', 'sparkles', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w09_milk_white', 'colors_l6', 'milk white', 'trắng sữa', '/mɪlk waɪt/', 'Fresh cup is wholesome milk white.', 'Ly sữa tươi mang sắc trắng bổ dưỡng.', 'cup.and.saucer.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l06_w10_grape_purple', 'colors_l6', 'grape purple', 'tím nho chín', '/ɡreɪp ˈpɜː.pəl/', 'Jelly is delicious grape purple.', 'Món thạch có sắc tím nho chín mọng thơm lừng.', 'circle.grid.2x2.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w01_rainbow', 'colors_l7', 'rainbow', 'cầu vồng', '/ˈreɪn.bəʊ/', 'Rainbow smiles across the gentle rain.', 'Cầu vồng rạng rỡ sau cơn mưa rào nhẹ hạt.', 'cloud.sun.rain.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w02_colorful', 'colors_l7', 'colorful', 'rực rỡ sắc màu', '/ˈkʌl.ə.fəl/', 'The bird has colorful wings.', 'Chú chim có đôi cánh rực rỡ sắc màu.', 'sparkles', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w03_vivid', 'colors_l7', 'vivid', 'sống động', '/ˈvɪv.ɪd/', 'The painting shows vivid flowers.', 'Bức tranh vẽ những đóa hoa sống động như thật.', 'paintpalette.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w04_bright', 'colors_l7', 'bright', 'tươi sáng', '/braɪt/', 'The morning room is bright and joyful.', 'Căn phòng buổi sớm tươi sáng và ngập tràn niềm vui.', 'sun.max.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w05_dark', 'colors_l7', 'dark', 'tối màu', '/dɑːk/', 'The midnight sky is peacefully dark.', 'Bầu trời đêm tĩnh lặng mang màu sắc huyền bí.', 'moon.stars.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w06_light', 'colors_l7', 'light', 'nhạt màu', '/laɪt/', 'She prefers light colored shirts.', 'Bé thích mặc những chiếc áo màu sáng nhạt.', 'tshirt.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w07_shiny', 'colors_l7', 'shiny', 'sáng bóng', '/ˈʃaɪ.ni/', 'Clean shoes are shiny and neat.', 'Đôi giày sạch sẽ sáng bóng và ngăn nắp.', 'sparkles', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w08_dull', 'colors_l7', 'dull', 'mờ đục', '/dʌl/', 'Dry rock looks dull without water.', 'Hòn đá khô trông mờ đục khi vắng bóng nước.', 'circle.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w09_neon', 'colors_l7', 'neon', 'màu phát sáng', '/ˈniː.ɒn/', 'Sign lights with vibrant neon colors.', 'Tấm biển hiệu phát ra ánh sáng neon rực rỡ.', 'lightbulb.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l07_w10_crystal', 'colors_l7', 'crystal', 'trong như pha lê', '/ˈkrɪs.təl/', 'Stream is crystal clear and cool.', 'Dòng suối trong vắt như pha lê mát rượi.', 'drop.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w01_warm', 'colors_l8', 'warm', 'gam màu ấm', '/wɔːm/', 'Red and orange are warm colors.', 'Màu đỏ và màu cam là những gam màu ấm áp.', 'flame.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w02_cool', 'colors_l8', 'cool', 'gam màu lạnh', '/kuːl/', 'Blue and green are cool colors.', 'Màu xanh dương và xanh lá là những gam màu tươi mát.', 'snowflake', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w03_deep', 'colors_l8', 'deep', 'đậm đà', '/diːp/', 'Deep forest has quiet shadows.', 'Khu rừng sâu có những bóng râm đậm màu tĩnh mịch.', 'tree.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w04_soft', 'colors_l8', 'soft', 'dịu nhẹ', '/sɒft/', 'The soft pastel colors help baby sleep.', 'Gam màu dịu nhẹ giúp bé ngủ thật ngon giấc.', 'bed.double.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w05_pale', 'colors_l8', 'pale', 'nhợt nhạt', '/peɪl/', 'The winter sky can be pale blue.', 'Bầu trời mùa đông có thể mang màu xanh nhạt.', 'cloud.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w06_glowing', 'colors_l8', 'glowing', 'tỏa sáng', '/ˈɡləʊ.ɪŋ/', 'The lantern is glowing in the night.', 'Chiếc lồng đèn tỏa sáng lung linh trong đêm rằm.', 'lightbulb.max.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w07_matte', 'colors_l8', 'matte', 'mờ lì', '/mæt/', 'The painted clay cup has a matte finish.', 'Chiếc cốc gốm có bề mặt mờ lì nhã nhặn.', 'cup.and.saucer.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w08_glittery', 'colors_l8', 'glittery', 'lấp lánh', '/ˈɡlɪt.ər.i/', 'The star wand is glittery magic.', 'Chiếc gậy thần ngôi sao lấp lánh phép màu.', 'wand.and.stars', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w09_clear', 'colors_l8', 'clear', 'trong suốt', '/klɪər/', 'The clean water is clear and pure.', 'Làn nước tinh khiết trong suốt không tì vết.', 'drop.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l08_w10_transparent', 'colors_l8', 'transparent', 'xuyên thấu', '/trænˈspær.ənt/', 'Glass window is clean and transparent.', 'Khung cửa sổ kính sạch sẽ trong suốt đón nắng.', 'square.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w01_turquoise', 'colors_l9', 'turquoise', 'màu ngọc lam', '/ˈtɜː.kwɔɪz/', 'Tropical sea has turquoise waves.', 'Vùng biển nhiệt đới có làn sóng ngọc lam mát rượi.', 'water.waves', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w02_teal', 'colors_l9', 'teal', 'xanh cổ vịt', '/tiːl/', 'Her notebook has a pretty teal cover.', 'Cuốn vở của bé có bìa màu xanh cổ vịt thanh nhã.', 'book.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w03_magenta', 'colors_l9', 'magenta', 'đỏ cánh sen', '/məˈdʒen.tə/', 'The orchid petal is rich magenta.', 'Cánh hoa phong lan mang sắc đỏ cánh sen rực rỡ.', 'camera.macro', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w04_coral', 'colors_l9', 'coral', 'hồng san hô', '/ˈkɒr.əl/', 'Coral reef glows in the blue ocean.', 'Rạn san hô hồng rực rỡ dưới đáy biển xanh.', 'sparkle', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w05_aqua', 'colors_l9', 'aqua', 'xanh nước biển', '/ˈæk.wə/', 'Pool water is fresh aqua clean.', 'Làn nước hồ bơi xanh mát tinh khôi.', 'drop.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w06_khaki', 'colors_l9', 'khaki', 'màu kaki', '/ˈkɑː.ki/', 'Travel shorts are strong khaki cloth.', 'Chiếc quần soóc đi dã ngoại làm bằng vải kaki bền bỉ.', 'figure.walk', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w07_burgundy', 'colors_l9', 'burgundy', 'đỏ rượu vang', '/ˈbɜː.ɡən.di/', 'The royal curtain is royal burgundy.', 'Tấm rèm cung điện mang sắc đỏ nhung quý phái.', 'curtains.closed', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w08_cyan', 'colors_l9', 'cyan', 'xanh lơ', '/ˈsaɪ.ən/', 'Printer uses cyan ink for bright sky.', 'Máy in dùng mực xanh lơ để in nền trời tươi sáng.', 'printer.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w09_lilac', 'colors_l9', 'lilac', 'màu tím cà nhẹ', '/ˈlaɪ.lək/', 'Spring breeze brings sweet lilac blooms.', 'Gió xuân mang theo hương sắc hoa cà tím dịu.', 'leaf.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l09_w10_plum', 'colors_l9', 'plum', 'tím mận chín', '/plʌm/', 'Ripe fruit is delicious plum purple.', 'Quả mận chín mang sắc tím mọng nước thơm ngọt.', 'circle.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w01_paint', 'colors_l10', 'paint', 'sơn màu / vẽ', '/peɪnt/', 'We paint a happy green dinosaur.', 'Bé cùng nhau vẽ một chú khủng long xanh vui vẻ.', 'paintbrush.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w02_brush', 'colors_l10', 'brush', 'cọ vẽ', '/brʌʃ/', 'Dino holds a small paintbrush gently.', 'Dino nhẹ nhàng cầm chiếc cọ vẽ nhỏ xinh.', 'paintbrush.pointed.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w03_palette', 'colors_l10', 'palette', 'bảng pha màu', '/ˈpæl.ət/', 'The wooden palette holds rainbow colors.', 'Bảng màu bằng gỗ chứa đựng muôn màu cầu vồng.', 'paintpalette.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w04_crayon', 'colors_l10', 'crayon', 'bút sáp màu', '/ˈkreɪ.ɒn/', 'Color the flower with red crayon.', 'Bé hãy tô bông hoa bằng bút sáp màu đỏ nhé.', 'pencil.tip', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w05_shade', 'colors_l10', 'shade', 'sắc thái màu', '/ʃeɪd/', 'There are many shades of green leaves.', 'Có rất nhiều sắc thái xanh khác nhau của lá cây.', 'leaf.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w06_tint', 'colors_l10', 'tint', 'sắc nhạt', '/tɪnt/', 'Add white to make a lighter tint.', 'Thêm chút màu trắng để tạo sắc màu nhạt hơn.', 'drop.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w07_dye', 'colors_l10', 'dye', 'thuốc nhuộm', '/daɪ/', 'Natural dye gives silk its bright color.', 'Thuốc nhuộm tự nhiên mang lại màu sắc tươi tắn cho lụa.', 'tshirt.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w08_color', 'colors_l10', 'color', 'màu sắc', '/ˈkʌl.ər/', 'What is your favorite color?', 'Màu sắc mà bé yêu thích nhất là màu gì nào?', 'paintpalette.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w09_hue', 'colors_l10', 'hue', 'tông màu', '/hjuː/', 'The sunset displays a beautiful warm hue.', 'Hoàng hôn buông xuống mang tông màu ấm áp tuyệt đẹp.', 'sun.max.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('colors_l10_w10_sparkle', 'colors_l10', 'sparkle', 'lấp lánh', '/ˈspɑː.kəl/', 'Glitter makes the drawing sparkle with joy.', 'Bột kim tuyến làm cho bức tranh lấp lánh niềm vui.', 'sparkles', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w01_apple', 'fruits_l1', 'apple', 'quả táo', '/ˈæp.əl/', 'I like crunchy red apple.', 'Bé thích quả táo đỏ giòn tan.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w02_banana', 'fruits_l1', 'banana', 'quả chuối', '/bəˈnɑː.nə/', 'The yellow banana is sweet.', 'Quả chuối vàng ngọt lịm.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w03_orange', 'fruits_l1', 'orange', 'quả cam', '/ˈɒr.ɪndʒ/', 'Juicy orange gives vitamin C.', 'Quả cam mọng nước dồi dào vitamin C.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w04_grape', 'fruits_l1', 'grape', 'quả nho', '/ɡreɪp/', 'Sweet grapes grow in bunches.', 'Những chùm nho ngọt trĩu cành.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w05_strawberry', 'fruits_l1', 'strawberry', 'dâu tây', '/ˈstrɔː.bər.i/', 'Red strawberry is sweet and sour.', 'Quả dâu tây đỏ chua chua ngọt ngọt.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w06_watermelon', 'fruits_l1', 'watermelon', 'dưa hấu', '/ˈwɔː.təˌmel.ən/', 'Cold watermelon cools summer days.', 'Miếng dưa hấu mát lạnh xua tan ngày hè.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w07_mango', 'fruits_l1', 'mango', 'quả xoài', '/ˈmæŋ.ɡəʊ/', 'Ripe yellow mango smells delicious.', 'Quả xoài chín vàng thơm nức mũi.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w08_pineapple', 'fruits_l1', 'pineapple', 'quả dứa', '/ˈpaɪnˌæp.əl/', 'The pineapple wears a green crown.', 'Quả dứa đội chiếc vương miện xanh.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w09_lemon', 'fruits_l1', 'lemon', 'quả chanh vàng', '/ˈlem.ən/', 'Yellow lemon makes yummy lemonade.', 'Quả chanh vàng làm nước chanh thật ngon.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l01_w10_peach', 'fruits_l1', 'peach', 'quả đào', '/piːtʃ/', 'Soft peach is juicy and sweet.', 'Quả đào mềm nhiều nước và ngọt thanh.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w01_blueberry', 'fruits_l2', 'blueberry', 'việt quất', '/ˈbluː.bər.i/', 'Little blueberry is rich in nutrients.', 'Quả việt quất nhỏ xinh giàu dưỡng chất.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w02_raspberry', 'fruits_l2', 'raspberry', 'phúc bồn tử', '/ˈrɑːz.bər.i/', 'Red raspberry tops the birthday cake.', 'Phúc bồn tử đỏ trang trí bánh sinh nhật.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w03_blackberry', 'fruits_l2', 'blackberry', 'mâm xôi đen', '/ˈblæk.bər.i/', 'Dark blackberry grows on bushes.', 'Mâm xôi đen chín mọng trên bụi cây.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w04_cherry', 'fruits_l2', 'cherry', 'quả anh đào', '/ˈtʃer.i/', 'Two red cherries hang on one stem.', 'Hai quả anh đào đỏ treo trên cùng một cuống.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w05_cranberry', 'fruits_l2', 'cranberry', 'nam việt quất', '/ˈkræn.bər.i/', 'Tart cranberry makes holiday sauce.', 'Nam việt quất tạo hương vị độc đáo cho ngày lễ.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w06_mulberry', 'fruits_l2', 'mulberry', 'quả dâu tằm', '/ˈmʌl.bər.i/', 'Sweet mulberry turns purple when ripe.', 'Dâu tằm ngọt chuyển sang màu tím khi chín.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w07_gooseberry', 'fruits_l2', 'gooseberry', 'quả lý gai', '/ˈɡʊz.bər.i/', 'Green gooseberry has pleasant tartness.', 'Quả lý gai xanh có vị chua dịu.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w08_elderberry', 'fruits_l2', 'elderberry', 'quả cơm cháy', '/ˈel.də.bər.i/', 'Elderberry syrup soothes the throat.', 'Siro quả cơm cháy làm dịu cổ họng.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w09_blackcurrant', 'fruits_l2', 'blackcurrant', 'nho chuỗi ngọc đen', '/ˌblækˈkʌr.ənt/', 'Blackcurrant is made into yummy jam.', 'Nho chuỗi ngọc đen được làm thành mứt ngon.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l02_w10_redcurrant', 'fruits_l2', 'redcurrant', 'nho chuỗi ngọc đỏ', '/ˈredˌkʌr.ənt/', 'Redcurrant glistens like tiny rubies.', 'Những quả nho chuỗi ngọc đỏ lấp lánh như ngọc.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w01_papaya', 'fruits_l3', 'papaya', 'quả đu đủ', '/pəˈpaɪ.ə/', 'Orange papaya has black round seeds.', 'Đu đủ ruột cam có những hạt tròn đen.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w02_coconut', 'fruits_l3', 'coconut', 'quả dừa', '/ˈkəʊ.kə.nʌt/', 'Cool coconut water is refreshing.', 'Nước dừa tươi mát rượi giải nhiệt.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w03_guava', 'fruits_l3', 'guava', 'quả ổi', '/ˈɡwɑː.və/', 'Crunchy guava smells fragrant in garden.', 'Quả ổi giòn tỏa hương thơm ngát trong vườn.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w04_lychee', 'fruits_l3', 'lychee', 'quả vải', '/ˈlaɪ.tʃiː/', 'Sweet lychee has white juicy flesh.', 'Quả vải ngọt lịm có cùi trắng mọng nước.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w05_dragonfruit', 'fruits_l3', 'dragonfruit', 'thanh long', '/ˈdræɡ.ən.fruːt/', 'Dragonfruit has bright pink skin.', 'Quả thanh long có lớp vỏ hồng rực rỡ.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w06_passionfruit', 'fruits_l3', 'passionfruit', 'chanh dây', '/ˈpæʃ.ənˌfruːt/', 'Fragrant passionfruit makes lovely juice.', 'Chanh dây thơm lừng pha nước uống rất ngon.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w07_kiwi', 'fruits_l3', 'kiwi', 'quả kiwi', '/ˈkiː.wiː/', 'Green kiwi has tiny black seeds inside.', 'Quả kiwi xanh có những hạt đen nhỏ li ti bên trong.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w08_avocado', 'fruits_l3', 'avocado', 'quả bơ', '/ˌæv.əˈkɑː.dəʊ/', 'Creamy avocado makes delicious smoothie.', 'Quả bơ béo ngậy làm sinh tố cực ngon.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w09_starfruit', 'fruits_l3', 'starfruit', 'quả khế', '/ˈstɑː.fruːt/', 'Sliced starfruit looks like bright stars.', 'Khế thái lát trông giống như những ngôi sao sáng.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l03_w10_durian', 'fruits_l3', 'durian', 'sầu riêng', '/ˈdʒʊə.ri.ən/', 'The durian has a spiky golden shell.', 'Quả sầu riêng có lớp gai nhọn màu vàng.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w01_pear', 'fruits_l4', 'pear', 'quả lê', '/peər/', 'Sweet green pear is crisp and juicy.', 'Quả lê xanh ngọt giòn rụm và nhiều nước.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w02_plum', 'fruits_l4', 'plum', 'quả mận', '/plʌm/', 'Purple plum tastes sweet under warm sun.', 'Quả mận tím ngọt ngào dưới nắng ấm.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w03_apricot', 'fruits_l4', 'apricot', 'quả mơ', '/ˈeɪ.prɪ.kɒt/', 'Golden apricot has soft velvety skin.', 'Quả mơ vàng ươm có lớp vỏ mịn như nhung.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w04_fig', 'fruits_l4', 'fig', 'quả sung Mỹ', '/fɪɡ/', 'Sweet fig is filled with honey nectar.', 'Quả sung Mỹ ngọt ngào chứa mật thơm.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w05_pomegranate', 'fruits_l4', 'pomegranate', 'quả lựu', '/ˈpɒm.ɪˌɡræn.ɪt/', 'Pomegranate carries hundreds of red seeds.', 'Quả lựu chứa hàng trăm hạt đỏ lấp lánh.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w06_persimmon', 'fruits_l4', 'persimmon', 'quả hồng', '/pəˈsɪm.ən/', 'Ripe persimmon is sweet like honey candy.', 'Quả hồng chín ngọt lịm như kẹo mật ong.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w07_date', 'fruits_l4', 'date', 'quả chà là', '/deɪt/', 'Sweet dates provide natural energy.', 'Quả chà là ngọt mang lại năng lượng tự nhiên.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w08_quince', 'fruits_l4', 'quince', 'quả mộc qua', '/kwɪns/', 'Golden quince smells fragrant when cooked.', 'Quả mộc qua vàng thơm lừng khi được nấu chín.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w09_nectarine', 'fruits_l4', 'nectarine', 'xuân đào', '/ˈnek.tər.iːn/', 'Smooth nectarine is sweet and sunny.', 'Quả xuân đào vỏ nhẵn thơm ngọt vị nắng.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l04_w10_kumquat', 'fruits_l4', 'kumquat', 'quả quất', '/ˈkʌm.kwɒt/', 'Tiny kumquat can be eaten whole.', 'Quả quất nhỏ có thể ăn được cả vỏ.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w01_lime', 'fruits_l5', 'lime', 'chanh xanh', '/laɪm/', 'Green lime adds tangy zest to soup.', 'Chanh xanh tạo vị chua thanh cho bát súp.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w02_grapefruit', 'fruits_l5', 'grapefruit', 'bưởi chùm', '/ˈɡreɪp.fruːt/', 'Pink grapefruit is full of fresh juice.', 'Bưởi chùm ruột hồng mọng nước tươi ngon.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w03_mandarin', 'fruits_l5', 'mandarin', 'quýt đường', '/ˈmæn.dər.ɪn/', 'Sweet mandarin is easy for kids to peel.', 'Quýt đường ngọt rất dễ bóc cho các bé.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w04_clementine', 'fruits_l5', 'clementine', 'quýt clementine', '/ˈklem.ən.tiːn/', 'Seedless clementine is a happy snack.', 'Quýt clementine không hạt là món ăn vặt tuyệt vời.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w05_tangerine', 'fruits_l5', 'tangerine', 'quả quýt', '/ˌtæŋ.dʒəˈriːn/', 'Bright tangerine shines in holiday season.', 'Quả quýt tươi sáng trong mùa lễ hội.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w06_pomelo', 'fruits_l5', 'pomelo', 'quả bưởi', '/ˈpɒm.ə.ləʊ/', 'Big green pomelo is sweet and refreshing.', 'Quả bưởi to xanh ngọt dịu và sảng khoái.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w07_yuzu', 'fruits_l5', 'yuzu', 'chanh yuzu', '/ˈjuː.zuː/', 'Fragrant yuzu has unique citrus aroma.', 'Chanh yuzu có hương thơm độc đáo.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w08_blood_orange', 'fruits_l5', 'blood orange', 'cam đỏ', '/blʌd ˈɒr.ɪndʒ/', 'Blood orange has deep ruby slices.', 'Cam đỏ có những múi màu đỏ thẫm bắt mắt.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w09_bergamot', 'fruits_l5', 'bergamot', 'cam bergamot', '/ˈbɜː.ɡə.mɒt/', 'Bergamot peel gives tea lovely perfume.', 'Vỏ cam bergamot mang lại hương thơm cho tách trà.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l05_w10_citron', 'fruits_l5', 'citron', 'thanh yên', '/ˈsɪt.rən/', 'Fragrant citron has thick golden peel.', 'Quả thanh yên có lớp vỏ vàng thơm ngát.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w01_cantaloupe', 'fruits_l6', 'cantaloupe', 'dưa lưới', '/ˈkæn.tə.luːp/', 'Fresh cantaloupe is sweet and very healthy.', 'Món dưa lưới tươi ngon, ngọt lành và rất tốt cho sức khỏe của bé.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w02_honeydew_melon', 'fruits_l6', 'honeydew melon', 'dưa lê xanh', '/ˈhʌn.i.djuː ˈmel.ən/', 'Honeydew melon is refreshing and cool.', 'Dưa lê xanh ngọt mát lành và giải nhiệt.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w03_muskmelon', 'fruits_l6', 'muskmelon', 'dưa bở thơm', '/ˈmʌskˌmel.ən/', 'Muskmelon perfumes the entire kitchen.', 'Quả dưa bở tỏa hương thơm ngát cả gian bếp.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w04_raisin', 'fruits_l6', 'raisin', 'nho khô', '/ˈreɪ.zən/', 'Sweet raisins make yummy oatmeal cookies.', 'Nho khô ngọt ngào làm nên những chiếc bánh quy thơm.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w05_plantain', 'fruits_l6', 'plantain', 'chuối lá / chuối ngự', '/ˈplæn.tɪn/', 'Cooked plantain is hearty and warm.', 'Món chuối nấu ấm bụng và bổ dưỡng.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w06_olive', 'fruits_l6', 'olive', 'quả ô liu', '/ˈɒl.ɪv/', 'Green olives grow under Mediterranean sunshine.', 'Quả ô liu xanh tắm mình dưới nắng ấm Địa Trung Hải.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w07_jackfruit', 'fruits_l6', 'jackfruit', 'quả mít', '/ˈdʒæk.fruːt/', 'Golden jackfruit has sweet aromatic bulbs.', 'Những múi mít vàng ươm ngọt lịm thơm phức.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w08_breadfruit', 'fruits_l6', 'breadfruit', 'quả sa-kê', '/ˈbred.fruːt/', 'Baked breadfruit tastes like soft bread.', 'Sa-kê nướng có hương vị thơm bùi như bánh mì.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w09_chayote', 'fruits_l6', 'chayote', 'quả su su', '/tʃɑːˈjəʊ.teɪ/', 'Green chayote grows on garden trellis.', 'Quả su su xanh leo giàn trước vườn nhà.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l06_w10_bitter_melon', 'fruits_l6', 'bitter melon', 'mướp đắng', '/ˈbɪt.ər ˈmel.ən/', 'Bitter melon is healthy and cooling.', 'Mướp đắng thanh nhiệt rất tốt cho sức khỏe.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w01_rambutan', 'fruits_l7', 'rambutan', 'chôm chôm', '/ræmˈbuː.tən/', 'Hairy red rambutan is sweet and juicy.', 'Chôm chôm đỏ râu ngọt mọng nước.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w02_mangosteen', 'fruits_l7', 'mangosteen', 'măng cụt', '/ˈmæŋ.ɡə.stiːn/', 'Mangosteen is queen of tropical fruits.', 'Măng cụt được mệnh danh là nữ hoàng trái cây.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w03_longan', 'fruits_l7', 'longan', 'quả nhãn', '/ˈlɒŋ.ɡən/', 'Longan has sweet translucent flesh.', 'Quả nhãn có cùi trắng trong ngọt lịm.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w04_tamarind', 'fruits_l7', 'tamarind', 'quả me', '/ˈtæm.ər.ɪnd/', 'Sweet and sour tamarind makes candy.', 'Me chua ngọt được làm thành kẹo thơm ngon.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w05_sapodilla', 'fruits_l7', 'sapodilla', 'quả hồng xiêm', '/ˌsæp.əˈdɪl.ə/', 'Brown sapodilla tastes like brown sugar.', 'Hồng xiêm nâu ngọt ngào như đường mía.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w06_custard_apple', 'fruits_l7', 'custard apple', 'quả na / mãng cầu', '/ˈkʌs.təd ˈæp.əl/', 'Custard apple has soft creamy segments.', 'Quả na có những múi mềm ngọt béo như kem.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w07_jujube', 'fruits_l7', 'jujube', 'táo tàu', '/ˈdʒuː.dʒuːb/', 'Red jujube is used in herbal soup.', 'Táo tàu đỏ thường dùng trong các món canh bổ.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w08_rose_apple', 'fruits_l7', 'rose apple', 'quả mận / quả roi', '/rəʊz ˈæp.əl/', 'Bell shaped rose apple is crunchy.', 'Quả roi hình chiếc chuông ăn giòn rụm.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w09_soursop', 'fruits_l7', 'soursop', 'mãng cầu xiêm', '/ˈsaʊə.sɒp/', 'Soursop smoothie is delightfully tart.', 'Sinh tố mãng cầu xiêm chua chua ngọt ngọt.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l07_w10_langsat', 'fruits_l7', 'langsat', 'quả bòn bon', '/ˈlæŋ.sæt/', 'Sweet langsat grows in tight clusters.', 'Những chùm bòn bon ngọt trĩu cành.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w01_peanut', 'fruits_l8', 'peanut', 'hạt lạc / đậu phộng', '/ˈpiː.nʌt/', 'Peanut butter is creamy on toast.', 'Bơ đậu phộng quết bánh mì béo ngậy.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w02_almond', 'fruits_l8', 'almond', 'hạnh nhân', '/ˈɑː.mənd/', 'Crunchy almond is great brain food.', 'Hạt hạnh nhân giòn rụm rất tốt cho trí não.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w03_walnut', 'fruits_l8', 'walnut', 'óc chó', '/ˈwɔːl.nʌt/', 'Walnut looks like a tiny brain inside.', 'Nhân hạt óc chó trông như một bộ não nhỏ.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w04_cashew', 'fruits_l8', 'cashew', 'hạt điều', '/ˈkæʃ.uː/', 'Roasted cashew is deliciously buttery.', 'Hạt điều rang thơm bùi béo ngậy.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w05_chestnut', 'fruits_l8', 'chestnut', 'hạt dẻ', '/ˈtʃes.nʌt/', 'Roasted chestnuts warm autumn nights.', 'Hạt dẻ nướng sưởi ấm những đêm thu.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w06_hazelnut', 'fruits_l8', 'hazelnut', 'hạt phỉ', '/ˈheɪ.zəl.nʌt/', 'Hazelnut chocolate is a favorite treat.', 'Sô-cô-la hạt phỉ là món khoái khẩu của bé.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w07_pistachio', 'fruits_l8', 'pistachio', 'hạt dẻ cười', '/pɪˈstæʃ.i.əʊ/', 'Green pistachio smiles in open shell.', 'Hạt dẻ cười xanh hé mở lớp vỏ chào bé.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w08_macadamia', 'fruits_l8', 'macadamia', 'hạt mắc ca', '/ˌmæk.əˈdeɪ.mi.ə/', 'Macadamia is the creamiest nut of all.', 'Hạt mắc ca là loại hạt béo ngậy nhất.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w09_sesame', 'fruits_l8', 'sesame', 'hạt mè / vừng', '/ˈses.ə.mi/', 'Tiny sesame seeds sprinkle on rolls.', 'Những hạt vừng nhỏ rắc đều trên bánh mì.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l08_w10_sunflower_seed', 'fruits_l8', 'sunflower seed', 'hạt hướng dương', '/ˈsʌnˌflaʊ.ər siːd/', 'Sunflower seeds are fun to crack and eat.', 'Hạt hướng dương vừa cắn vừa trò chuyện thật vui.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w01_skin', 'fruits_l9', 'skin', 'vỏ ngoài', '/skɪn/', 'Wash the apple skin before eating.', 'Rửa sạch vỏ táo trước khi thưởng thức nhé.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w02_peel', 'fruits_l9', 'peel', 'bóc vỏ / vỏ', '/piːl/', 'Peel the banana carefully.', 'Bé hãy bóc vỏ chuối cẩn thận nào.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w03_seed', 'fruits_l9', 'seed', 'hạt', '/siːd/', 'Plant the seed in fertile soil.', 'Gieo hạt mầm nhỏ vào lòng đất màu mỡ.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w04_pulp', 'fruits_l9', 'pulp', 'thịt quả', '/pʌlp/', 'Orange juice has tasty pulp inside.', 'Nước cam có những tép thịt quả thơm ngon.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w05_slice', 'fruits_l9', 'slice', 'lát cắt', '/slaɪs/', 'Mother cuts melon into pretty slices.', 'Mẹ cắt dưa thành những lát thật đẹp.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w06_stem', 'fruits_l9', 'stem', 'cuống quả', '/stem/', 'The cherry hangs by a thin green stem.', 'Quả anh đào treo trên cuống xanh mảnh mai.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w07_juice', 'fruits_l9', 'juice', 'nước quả', '/dʒuːs/', 'Fresh fruit juice is full of goodness.', 'Nước ép trái cây tươi tràn đầy dưỡng chất.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w08_flesh', 'fruits_l9', 'flesh', 'cùi quả', '/fleʃ/', 'Mango flesh is golden and sweet.', 'Cùi xoài vàng ươm và ngọt lịm.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w09_leaf', 'fruits_l9', 'leaf', 'chiếc lá', '/liːf/', 'The orange has a little green leaf.', 'Quả cam còn vương chiếc lá xanh nhỏ.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l09_w10_core', 'fruits_l9', 'core', 'lõi quả', '/kɔːr/', 'Leave the apple core on the plate.', 'Để lại lõi quả táo trên đĩa nhé bé.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w01_sweet', 'fruits_l10', 'sweet', 'ngọt ngào', '/swiːt/', 'Ripe watermelon is deliciously sweet.', 'Dưa hấu chín mang vị ngọt lịm tuyệt vời.', 'apple.logo', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w02_sour', 'fruits_l10', 'sour', 'chua chua', '/saʊər/', 'Green mango is delightfully sour.', 'Xoài xanh chua chua chấm muối ngon tuyệt.', 'apple.logo', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w03_juicy', 'fruits_l10', 'juicy', 'mọng nước', '/ˈdʒuː.si/', 'The peach is juicy and refreshing.', 'Quả đào mọng nước và tươi mát.', 'apple.logo', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w04_ripe', 'fruits_l10', 'ripe', 'chín muồi', '/raɪp/', 'The banana is ripe and ready to eat.', 'Quả chuối đã chín vàng sẵn sàng cho bé ăn.', 'apple.logo', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w05_fresh', 'fruits_l10', 'fresh', 'tươi mới', '/freʃ/', 'Farmers bring fresh fruits to market.', 'Bác nông dân mang trái cây tươi ra chợ.', 'apple.logo', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w06_delicious', 'fruits_l10', 'delicious', 'thơm ngon', '/dɪˈlɪʃ.əs/', 'Fruit salad is colorful and delicious.', 'Món hoa quả dầm vừa đẹp mắt vừa thơm ngon.', 'apple.logo', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w07_tart', 'fruits_l10', 'tart', 'chua dịu', '/tɑːt/', 'Berries have a pleasant tart taste.', 'Các loại quả mọng có vị chua dịu thanh tao.', 'apple.logo', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w08_bitter', 'fruits_l10', 'bitter', 'đắng nhẹ', '/ˈbɪt.ər/', 'Grapefruit skin has a bitter aroma.', 'Vỏ bưởi có mùi thơm hơi đắng nhẹ.', 'apple.logo', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w09_crisp', 'fruits_l10', 'crisp', 'giòn rụm', '/krɪsp/', 'The red apple is crisp when bitten.', 'Quả táo đỏ giòn rụm khi bé cắn vào.', 'apple.logo', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('fruits_l10_w10_tender', 'fruits_l10', 'tender', 'mềm mại', '/ˈten.dər/', 'Ripe melon is tender and melts in mouth.', 'Dưa chín mềm tan ngay trong miệng.', 'apple.logo', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w01_mother', 'family_l1', 'mother', 'mẹ', '/ˈmʌð.ər/', 'My mother hugs me with love.', 'Mẹ ôm bé thật ấm áp yêu thương.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w02_father', 'family_l1', 'father', 'bố / ba', '/ˈfɑː.ðər/', 'My father plays soccer with me.', 'Bố cùng bé đá bóng trong sân.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w03_baby', 'family_l1', 'baby', 'em bé', '/ˈbeɪ.bi/', 'The baby smiles in the crib.', 'Em bé mỉm cười trong chiếc nôi xinh.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w04_brother', 'family_l1', 'brother', 'anh / em trai', '/ˈbrʌð.ər/', 'My brother builds lego with me.', 'Anh trai cùng bé xếp hình lego.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w05_sister', 'family_l1', 'sister', 'chị / em gái', '/ˈsɪs.tər/', 'My sister reads picture books to me.', 'Chị gái đọc truyện tranh cho bé nghe.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w06_parents', 'family_l1', 'parents', 'cha mẹ', '/ˈpeə.rənts/', 'My parents love me unconditionally.', 'Cha mẹ luôn yêu thương bé vô bờ bến.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w07_son', 'family_l1', 'son', 'con trai', '/sʌn/', 'He is the proud son of the family.', 'Cậu bé là người con trai ngoan của cả nhà.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w08_daughter', 'family_l1', 'daughter', 'con gái', '/ˈdɔː.tər/', 'The little daughter sings happily.', 'Cô con gái nhỏ líu lo ca hát.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w09_family', 'family_l1', 'family', 'gia đình', '/ˈfæm.əl.i/', 'Our family shares meals together.', 'Cả gia đình quây quần bên mâm cơm ấm cúng.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l01_w10_home', 'family_l1', 'home', 'mái ấm', '/həʊm/', 'Home is where love never ends.', 'Nhà là nơi tràn ngập tình yêu thương.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w01_grandmother', 'family_l2', 'grandmother', 'bà', '/ˈɡrænˌmʌð.ər/', 'Grandmother knits a warm sweater.', 'Bà đan tặng bé chiếc áo len ấm.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w02_grandfather', 'family_l2', 'grandfather', 'ông', '/ˈɡrænˌfɑː.ðər/', 'Grandfather tells magical fairy tales.', 'Ông kể cho bé nghe những câu chuyện cổ tích kỳ diệu.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w03_grandma', 'family_l2', 'grandma', 'bà yêu', '/ˈɡræn.mɑː/', 'Grandma bakes delicious honey cookies.', 'Bà yêu nướng những chiếc bánh quy mật ong thơm phức.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w04_grandpa', 'family_l2', 'grandpa', 'ông yêu', '/ˈɡræn.pɑː/', 'Grandpa tends the flowering garden.', 'Ông yêu chăm sóc luống hoa trước sân.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w05_grandson', 'family_l2', 'grandson', 'cháu trai', '/ˈɡræn.sʌn/', 'Grandpa holds his little grandson hand.', 'Ông dắt tay cậu cháu trai nhỏ dạo bước.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w06_granddaughter', 'family_l2', 'granddaughter', 'cháu gái', '/ˈɡrænˌdɔː.tər/', 'Grandma braids granddaughter hair neatly.', 'Bà tết tóc gọn gàng cho cô cháu gái.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w07_grandchildren', 'family_l2', 'grandchildren', 'các cháu', '/ˈɡrænˌtʃɪl.drən/', 'Grandparents love all grandchildren dearly.', 'Ông bà thương yêu tất cả các cháu.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w08_elders', 'family_l2', 'elders', 'người lớn tuổi', '/ˈel.dəz/', 'We always respect our family elders.', 'Bé luôn kính trọng người lớn tuổi trong gia đình.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w09_ancestors', 'family_l2', 'ancestors', 'tổ tiên', '/ˈæn.ses.təz/', 'We honor ancestors with gratitude.', 'Gia đình tưởng nhớ tổ tiên với lòng biết ơn.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l02_w10_heritage', 'family_l2', 'heritage', 'truyền thống', '/ˈher.ɪ.tɪdʒ/', 'Family heritage passes kindness down.', 'Truyền thống gia đình lưu giữ lòng nhân hậu.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w01_uncle', 'family_l3', 'uncle', 'chú / bác / cậu', '/ˈʌŋ.kəl/', 'Uncle brings a surprise gift box.', 'Chú mang tặng bé một hộp quà bất ngờ.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w02_aunt', 'family_l3', 'aunt', 'cô / dì / bác gái', '/ɑːnt/', 'Aunt makes delicious fruit jelly.', 'Dì làm món thạch hoa quả thật ngon.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w03_cousin', 'family_l3', 'cousin', 'anh chị em họ', '/ˈkʌz.ən/', 'My cousin visits during summer break.', 'Anh em họ đến chơi trong kỳ nghỉ hè.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w04_nephew', 'family_l3', 'nephew', 'cháu trai họ', '/ˈnef.juː/', 'My little nephew learns how to walk.', 'Cậu cháu trai đang chập chững tập đi.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w05_niece', 'family_l3', 'niece', 'cháu gái họ', '/niːs/', 'My niece draws a cute dinosaur.', 'Cô cháu gái vẽ một chú khủng long đáng yêu.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w06_relatives', 'family_l3', 'relatives', 'bà con họ hàng', '/ˈrel.ə.tɪvz/', 'All relatives gather for the New Year.', 'Họ hàng sum họp đông đủ vào dịp năm mới.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w07_twins', 'family_l3', 'twins', 'cặp sinh đôi', '/twɪnz/', 'The twins wear matching blue shirts.', 'Cặp sinh đôi mặc áo màu xanh giống nhau.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w08_newborn', 'family_l3', 'newborn', 'bé sơ sinh', '/ˈnjuː.bɔːn/', 'The newborn baby sleeps peacefully.', 'Em bé sơ sinh ngủ thật ngoan và êm đềm.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w09_siblings', 'family_l3', 'siblings', 'anh chị em ruột', '/ˈsɪb.lɪŋz/', 'Good siblings always share their toys.', 'Anh chị em tốt luôn chia sẻ đồ chơi cùng nhau.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l03_w10_guardian', 'family_l3', 'guardian', 'người giám hộ', '/ˈɡɑː.di.ən/', 'Loving guardian protects the child.', 'Người chăm sóc luôn bảo bọc bé an toàn.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w01_love', 'family_l4', 'love', 'yêu thương', '/lʌv/', 'Family love grows stronger each day.', 'Tình yêu thương gia đình ngày càng lớn thêm.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w02_hug', 'family_l4', 'hug', 'ôm ấm áp', '/hʌɡ/', 'Give mommy a warm morning hug.', 'Bé ôm mẹ một cái thật ấm vào buổi sáng nhé.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w03_kiss', 'family_l4', 'kiss', 'nụ hôn yêu thương', '/kɪs/', 'Goodnight kiss brings sweet dreams.', 'Nụ hôn chúc ngủ ngon mang đến giấc mơ đẹp.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w04_smile', 'family_l4', 'smile', 'nụ cười', '/smaɪl/', 'Her bright smile lights up our home.', 'Nụ cười rạng rỡ của bé thắp sáng cả ngôi nhà.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w05_care', 'family_l4', 'care', 'chăm sóc', '/keər/', 'Parents take loving care of baby.', 'Cha mẹ ân cần chăm sóc cho bé yêu.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w06_hold', 'family_l4', 'hold', 'nắm tay / ôm giữ', '/həʊld/', 'Hold father hand when crossing road.', 'Nắm chặt tay bố khi qua đường bé nhé.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w07_protect', 'family_l4', 'protect', 'bảo vệ', '/prəˈtekt/', 'Parents always protect their children.', 'Cha mẹ luôn chở che cho các con.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w08_share', 'family_l4', 'share', 'chia sẻ', '/ʃeər/', 'We share stories around dinner table.', 'Cả nhà cùng chia sẻ chuyện vui bên bàn ăn.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w09_help', 'family_l4', 'help', 'giúp đỡ', '/help/', 'I help mother set the plates.', 'Bé giúp mẹ xếp bát đĩa ngay ngắn.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l04_w10_comfort', 'family_l4', 'comfort', 'dỗ dành', '/ˈkʌm.fət/', 'Mother comforts baby when crying.', 'Mẹ dỗ dành khi em bé khóc nhè.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w01_breakfast', 'family_l5', 'breakfast', 'bữa sáng', '/ˈbrek.fəst/', 'Eat a healthy breakfast with milk.', 'Ăn bữa sáng đầy đủ chất cùng sữa tươi.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w02_lunch', 'family_l5', 'lunch', 'bữa trưa', '/lʌntʃ/', 'Lunch is warm soup and fresh rice.', 'Bữa trưa có bát canh nóng và cơm dẻo.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w03_dinner', 'family_l5', 'dinner', 'bữa tối', '/ˈdɪn.ər/', 'Family gathers for dinner together.', 'Cả nhà quây quần bên bữa cơm tối.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w04_bedtime', 'family_l5', 'bedtime', 'giờ đi ngủ', '/ˈbed.taɪm/', 'Bedtime comes after brushing teeth.', 'Giờ đi ngủ đến sau khi bé đã đánh răng sạch sẽ.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w05_story', 'family_l5', 'story', 'câu chuyện', '/ˈstɔː.ri/', 'Father reads a bedtime story.', 'Bố đọc cho bé nghe câu chuyện trước giờ ngủ.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w06_playtime', 'family_l5', 'playtime', 'giờ chơi', '/ˈpleɪ.taɪm/', 'Playtime in the yard is so much fun.', 'Giờ vui chơi ngoài sân thật hào hứng.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w07_bath', 'family_l5', 'bath', 'tắm rửa', '/bɑːθ/', 'Warm bubble bath makes baby clean.', 'Bồn tắm ấm áp đầy bong bóng xà phòng giúp bé sạch sẽ.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w08_clean', 'family_l5', 'clean', 'lau dọn', '/kliːn/', 'We clean our room before dinner.', 'Bé cùng dọn dẹp phòng trước bữa tối.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w09_rest', 'family_l5', 'rest', 'nghỉ ngơi', '/rest/', 'Take a quiet rest after playtime.', 'Nghỉ ngơi một lát sau giờ vui chơi bé nhé.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l05_w10_wake', 'family_l5', 'wake', 'thức dậy', '/weɪk/', 'Wake up cheerfully with the morning sun.', 'Thức dậy rạng rỡ đón ánh nắng mai.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w01_living_room', 'family_l6', 'living room', 'phòng khách', '/ˈlɪv.ɪŋ ruːm/', 'Family chats in the cozy living room.', 'Cả nhà trò chuyện trong phòng khách ấm cúng.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w02_bedroom', 'family_l6', 'bedroom', 'phòng ngủ', '/ˈbed.ruːm/', 'My bedroom has a soft warm bed.', 'Phòng ngủ của bé có chiếc giường êm ấm.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w03_kitchen', 'family_l6', 'kitchen', 'nhà bếp', '/ˈkɪtʃ.ən/', 'Mother cooks yummy soup in kitchen.', 'Mẹ nấu món súp thơm ngon trong gian bếp.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w04_bathroom', 'family_l6', 'bathroom', 'phòng tắm', '/ˈbɑːθ.ruːm/', 'Wash hands clean in the bathroom.', 'Bé rửa tay sạch sẽ trong phòng tắm.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w05_garden', 'family_l6', 'garden', 'khu vườn', '/ˈɡɑː.dən/', 'Grandfather grows roses in the garden.', 'Ông trồng những khóm hoa hồng trong vườn.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w06_dining_room', 'family_l6', 'dining room', 'phòng ăn', '/ˈdaɪ.nɪŋ ruːm/', 'We eat together in the dining room.', 'Cả nhà cùng nhau dùng bữa trong phòng ăn.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w07_yard', 'family_l6', 'yard', 'sân nhà', '/jɑːd/', 'Children ride tricycles in the yard.', 'Các bé đạp xe ba bánh tung tăng ngoài sân.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w08_hallway', 'family_l6', 'hallway', 'hành lang', '/ˈhɔːl.weɪ/', 'Keep shoes neat along the hallway.', 'Để giày dép ngay ngắn dọc hành lang nhé.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w09_balcony', 'family_l6', 'balcony', 'ban công', '/ˈbæl.kə.ni/', 'Green plants grow happily on balcony.', 'Những chậu cây xanh tươi tốt ngoài ban công.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l06_w10_door', 'family_l6', 'door', 'cánh cửa', '/dɔːr/', 'Always knock gently on the door.', 'Bé nhớ gõ cửa nhẹ nhàng trước khi vào nhé.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w01_cooking', 'family_l7', 'cooking', 'nấu ăn', '/ˈkʊk.ɪŋ/', 'Cooking together creates sweet memories.', 'Cùng nhau nấu ăn tạo nên những kỷ niệm ngọt ngào.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w02_walking', 'family_l7', 'walking', 'đi dạo', '/ˈwɔː.kɪŋ/', 'Morning walking keeps family healthy.', 'Đi dạo buổi sớm giúp cả nhà khỏe mạnh.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w03_reading', 'family_l7', 'reading', 'đọc sách', '/ˈriː.dɪŋ/', 'Reading books opens new worlds.', 'Đọc sách mở ra những thế giới mới kỳ diệu.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w04_singing', 'family_l7', 'singing', 'ca hát', '/ˈsɪŋ.ɪŋ/', 'Singing happy songs with Dino.', 'Bé cùng Dino hát vang những bài ca vui nhộn.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w05_gardening', 'family_l7', 'gardening', 'làm vườn', '/ˈɡɑː.dən.ɪŋ/', 'Watering flowers during gardening time.', 'Tưới nước cho hoa trong giờ làm vườn.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w06_traveling', 'family_l7', 'traveling', 'du lịch', '/ˈtræv.əl.ɪŋ/', 'Family traveling to the sandy beach.', 'Cả nhà cùng đi du lịch tới bãi biển cát vàng.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w07_celebrating', 'family_l7', 'celebrating', 'chúc mừng', '/ˈsel.ə.breɪ.tɪŋ/', 'Celebrating brother high exam score.', 'Cùng chúc mừng anh trai đạt điểm cao.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w08_dining', 'family_l7', 'dining', 'dùng bữa', '/ˈdaɪ.nɪŋ/', 'Dining happily under warm lights.', 'Cả nhà vui vẻ dùng bữa dưới ánh đèn ấm áp.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w09_cleaning', 'family_l7', 'cleaning', 'dọn dẹp', '/ˈkliː.nɪŋ/', 'Weekend cleaning makes home sparkle.', 'Dọn dẹp cuối tuần giúp ngôi nhà sáng bóng.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l07_w10_laughing', 'family_l7', 'laughing', 'tiếng cười', '/ˈlɑː.fɪŋ/', 'Home is full of joyful laughing.', 'Ngôi nhà tràn ngập tiếng cười hạnh phúc.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w01_birthday', 'family_l8', 'birthday', 'sinh nhật', '/ˈbɜːθ.deɪ/', 'Blow out birthday candles with a wish.', 'Thổi nến sinh nhật và ước một điều ước bé nhé.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w02_party', 'family_l8', 'party', 'bữa tiệc', '/ˈpɑː.ti/', 'Holiday party is lively and bright.', 'Bữa tiệc ngày lễ rộn ràng và tươi vui.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w03_gift', 'family_l8', 'gift', 'món quà', '/ɡɪft/', 'Wrapped gift holds a sweet surprise.', 'Hộp quà gói nơ mang đến điều bất ngờ dễ thương.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w04_cake', 'family_l8', 'cake', 'bánh kem', '/keɪk/', 'Sweet cake has strawberry frosting.', 'Chiếc bánh kem ngọt ngào phủ lớp dâu tây.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w05_greeting', 'family_l8', 'greeting', 'lời chúc', '/ˈɡriː.tɪŋ/', 'Send warm greeting cards to grandma.', 'Gửi tấm thiệp chúc mừng ấm áp tới bà yêu.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w06_feast', 'family_l8', 'feast', 'bữa tiệc thịnh soạn', '/fiːst/', 'Holiday feast has delicious roast food.', 'Mâm cỗ ngày lễ thịnh soạn với nhiều món ngon.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w07_gathering', 'family_l8', 'gathering', 'buổi sum họp', '/ˈɡæð.ər.ɪŋ/', 'Family gathering warms cold winter night.', 'Buổi sum họp gia đình sưởi ấm đêm đông.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w08_tradition', 'family_l8', 'tradition', 'truyền thống', '/trəˈdɪʃ.ən/', 'Making sticky rice cake is tradition.', 'Gói bánh chưng là nét đẹp truyền thống.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w09_holiday', 'family_l8', 'holiday', 'ngày lễ', '/ˈhɒl.ə.deɪ/', 'Spring holiday brings blooming blossoms.', 'Kỳ nghỉ mùa xuân mang hoa nở rực rỡ.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l08_w10_toast', 'family_l8', 'toast', 'nâng ly chúc mừng', '/təʊst/', 'Parents toast to peace and happiness.', 'Cha mẹ nâng ly chúc bình an và hạnh phúc.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w01_happy', 'family_l9', 'happy', 'vui vẻ', '/ˈhæp.i/', 'We feel happy when family is near.', 'Bé cảm thấy vui vẻ khi ở bên người thân.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w02_proud', 'family_l9', 'proud', 'tự hào', '/praʊd/', 'Father is proud of your hard work.', 'Bố rất tự hào về sự chăm chỉ của bé.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w03_thankful', 'family_l9', 'thankful', 'biết ơn', '/ˈθæŋk.fəl/', 'Be thankful for meals mother cooks.', 'Hãy biết ơn những bữa cơm ngon mẹ nấu.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w04_safe', 'family_l9', 'safe', 'an toàn', '/seɪf/', 'I feel safe inside father arms.', 'Bé cảm thấy an toàn trong vòng tay bố.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w05_close', 'family_l9', 'close', 'gần gũi', '/kləʊs/', 'Brothers share a close bond.', 'Hai anh em có tình cảm vô cùng gắn bó.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w06_warm', 'family_l9', 'warm', 'ấm cúng', '/wɔːm/', 'Family dinner is warm and sweet.', 'Bữa tối gia đình ấm cúng và ngọt ngào.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w07_cheerful', 'family_l9', 'cheerful', 'tươi vui', '/ˈtʃɪə.fəl/', 'Baby gives a cheerful giggle.', 'Em bé bật cười khúc khích tươi vui.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w08_peaceful', 'family_l9', 'peaceful', 'yên bình', '/ˈpiːs.fəl/', 'Sunday morning is peaceful and calm.', 'Sáng chủ nhật thật yên bình và thanh thản.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w09_kind', 'family_l9', 'kind', 'nhân từ', '/kaɪnd/', 'Mother speaks with kind gentle words.', 'Mẹ luôn nói những lời dịu dàng nhân từ.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l09_w10_gentle', 'family_l9', 'gentle', 'dịu dàng', '/ˈdʒen.təl/', 'Grandma has gentle caring hands.', 'Bà có đôi bàn tay dịu dàng chăm chút.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w01_child', 'family_l10', 'child', 'đứa trẻ', '/tʃaɪld/', 'Every child is precious and loved.', 'Mỗi đứa trẻ đều là bảo bối được yêu thương.', 'person.3.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w02_toddler', 'family_l10', 'toddler', 'bé chập chững', '/ˈtɒd.lər/', 'The toddler takes first steps safely.', 'Bé chập chững bước những bước đi đầu đời.', 'person.3.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w03_teenager', 'family_l10', 'teenager', 'thiếu niên', '/ˈtiːnˌeɪ.dʒər/', 'Big sister is a smart teenager now.', 'Chị gái giờ đã là một thiếu niên thông minh.', 'person.3.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w04_adult', 'family_l10', 'adult', 'người lớn', '/ˈæd.ʌlt/', 'Adults work to support the family.', 'Người lớn nỗ lực làm việc chăm lo cho cả nhà.', 'person.3.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w05_elder', 'family_l10', 'elder', 'bậc trưởng bối', '/ˈel.dər/', 'Listen with respect to the elder.', 'Hãy lắng nghe lời dạy của bậc trưởng bối.', 'person.3.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w06_grow', 'family_l10', 'grow', 'lớn khôn', '/ɡrəʊ/', 'Eat good food to grow tall and strong.', 'Ăn uống đủ chất để bé lớn khôn khỏe mạnh.', 'person.3.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w07_learn', 'family_l10', 'learn', 'học hỏi', '/lɜːn/', 'Children learn good manners at home.', 'Các bé học những phép tắc ngoan ngoãn từ nhà.', 'person.3.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w08_guide', 'family_l10', 'guide', 'dẫn dắt', '/ɡaɪd/', 'Parents guide little steps forward.', 'Cha mẹ dìu dắt từng bước chân bé tiến bước.', 'person.3.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w09_teach', 'family_l10', 'teach', 'dạy bảo', '/tiːtʃ/', 'Grandfather teaches how to play chess.', 'Ông dạy bé cách chơi cờ vua khéo léo.', 'person.3.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('family_l10_w10_support', 'family_l10', 'support', 'nâng đỡ', '/səˈpɔːt/', 'Family members always support each other.', 'Các thành viên trong nhà luôn nâng đỡ nhau.', 'person.3.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w01_bread', 'food_l1', 'bread', 'bánh mì', '/bred/', 'This delicious bread smells so good!', 'Món bánh mì thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w02_milk', 'food_l1', 'milk', 'sữa tươi', '/mɪlk/', 'I drink fresh milk every morning.', 'Bé uống sữa tươi thơm ngon vào mỗi buổi sáng.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w03_egg', 'food_l1', 'egg', 'quả trứng', '/eɡ/', 'This delicious egg smells so good!', 'Món quả trứng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w04_butter', 'food_l1', 'butter', 'bơ', '/ˈbʌt.ər/', 'This delicious butter smells so good!', 'Món bơ thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w05_cheese', 'food_l1', 'cheese', 'phô mai', '/tʃiːz/', 'This delicious cheese smells so good!', 'Món phô mai thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w06_cereal', 'food_l1', 'cereal', 'ngũ cốc', '/ˈsɪə.ri.əl/', 'This delicious cereal smells so good!', 'Món ngũ cốc thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w07_pancake', 'food_l1', 'pancake', 'bánh kếp', '/ˈpæn.keɪk/', 'This delicious pancake smells so good!', 'Món bánh kếp thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w08_honey', 'food_l1', 'honey', 'mật ong', '/ˈhʌn.i/', 'This delicious honey smells so good!', 'Món mật ong thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w09_jam', 'food_l1', 'jam', 'mứt hoa quả', '/dʒæm/', 'This delicious jam smells so good!', 'Món mứt hoa quả thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l01_w10_toast', 'food_l1', 'toast', 'bánh mì nướng', '/təʊst/', 'This delicious toast smells so good!', 'Món bánh mì nướng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w01_rice', 'food_l2', 'rice', 'cơm dẻo', '/raɪs/', 'This delicious rice smells so good!', 'Món cơm dẻo thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w02_noodles', 'food_l2', 'noodles', 'mì sợi', '/ˈnuː.dəl/', 'This delicious noodles smells so good!', 'Món mì sợi thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w03_soup', 'food_l2', 'soup', 'món súp / canh', '/suːp/', 'I drink fresh soup every morning.', 'Bé uống món súp / canh thơm ngon vào mỗi buổi sáng.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w04_meat', 'food_l2', 'meat', 'thịt', '/miːt/', 'This delicious meat smells so good!', 'Món thịt thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w05_fish', 'food_l2', 'fish', 'món cá', '/fɪʃ/', 'This delicious fish smells so good!', 'Món món cá thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w06_chicken', 'food_l2', 'chicken', 'thịt gà', '/ˈtʃɪk.ɪn/', 'This delicious chicken smells so good!', 'Món thịt gà thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w07_beef', 'food_l2', 'beef', 'thịt bò', '/biːf/', 'This delicious beef smells so good!', 'Món thịt bò thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w08_potato', 'food_l2', 'potato', 'khoai tây', '/pəˈteɪ.təʊ/', 'This delicious potato smells so good!', 'Món khoai tây thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w09_salad', 'food_l2', 'salad', 'rau trộn', '/ˈsæl.əd/', 'This delicious salad smells so good!', 'Món rau trộn thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l02_w10_sandwich', 'food_l2', 'sandwich', 'bánh mì kẹp', '/ˈsæn.wɪdʒ/', 'This delicious sandwich smells so good!', 'Món bánh mì kẹp thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w01_carrot', 'food_l3', 'carrot', 'cà rốt', '/ˈkær.ət/', 'This delicious carrot smells so good!', 'Món cà rốt thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w02_tomato', 'food_l3', 'tomato', 'cà chua', '/təˈmɑː.təʊ/', 'This delicious tomato smells so good!', 'Món cà chua thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w03_cucumber', 'food_l3', 'cucumber', 'dưa chuột', '/ˈkjuː.kʌm.bər/', 'This delicious cucumber smells so good!', 'Món dưa chuột thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w04_corn', 'food_l3', 'corn', 'bắp ngô', '/kɔːn/', 'This delicious corn smells so good!', 'Món bắp ngô thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w05_broccoli', 'food_l3', 'broccoli', 'súp lơ xanh', '/ˈbrɒk.əl.i/', 'This delicious broccoli smells so good!', 'Món súp lơ xanh thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w06_onion', 'food_l3', 'onion', 'hành tây', '/ˈʌn.jən/', 'This delicious onion smells so good!', 'Món hành tây thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w07_lettuce', 'food_l3', 'lettuce', 'xà lách', '/ˈlet.ɪs/', 'This delicious lettuce smells so good!', 'Món xà lách thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w08_pea', 'food_l3', 'pea', 'đậu Hà Lan', '/piː/', 'This delicious pea smells so good!', 'Món đậu Hà Lan thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w09_pumpkin', 'food_l3', 'pumpkin', 'bí đỏ', '/ˈpʌmp.kɪn/', 'This delicious pumpkin smells so good!', 'Món bí đỏ thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l03_w10_mushroom', 'food_l3', 'mushroom', 'nấm', '/ˈmʌʃ.ruːm/', 'This delicious mushroom smells so good!', 'Món nấm thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w01_water', 'food_l4', 'water', 'nước lọc', '/ˈwɔː.tər/', 'I drink fresh water every morning.', 'Bé uống nước lọc thơm ngon vào mỗi buổi sáng.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w02_juice', 'food_l4', 'juice', 'nước ép', '/dʒuːs/', 'I drink fresh juice every morning.', 'Bé uống nước ép thơm ngon vào mỗi buổi sáng.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w03_tea', 'food_l4', 'tea', 'nước trà', '/tiː/', 'I drink fresh tea every morning.', 'Bé uống nước trà thơm ngon vào mỗi buổi sáng.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w04_smoothie', 'food_l4', 'smoothie', 'sinh tố', '/ˈsmuː.ði/', 'This delicious smoothie smells so good!', 'Món sinh tố thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w05_lemonade', 'food_l4', 'lemonade', 'nước chanh', '/ˌlem.əˈneɪd/', 'This delicious lemonade smells so good!', 'Món nước chanh thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w06_cocoa', 'food_l4', 'cocoa', 'ca cao nóng', '/ˈkəʊ.kəʊ/', 'This delicious cocoa smells so good!', 'Món ca cao nóng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w07_coconut_water', 'food_l4', 'coconut water', 'nước dừa', '/ˈkəʊ.kə.nʌt ˈwɔː.tər/', 'I drink fresh coconut water every morning.', 'Bé uống nước dừa thơm ngon vào mỗi buổi sáng.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w08_shake', 'food_l4', 'shake', 'sữa lắc', '/ʃeɪk/', 'This delicious shake smells so good!', 'Món sữa lắc thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w09_mineral_water', 'food_l4', 'mineral water', 'nước khoáng', '/ˈmɪn.ər.əl ˈwɔː.tər/', 'I drink fresh mineral water every morning.', 'Bé uống nước khoáng thơm ngon vào mỗi buổi sáng.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l04_w10_apple_juice', 'food_l4', 'apple juice', 'nước ép táo', '/ˈæp.əl dʒuːs/', 'I drink fresh apple juice every morning.', 'Bé uống nước ép táo thơm ngon vào mỗi buổi sáng.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w01_cake', 'food_l5', 'cake', 'bánh kem', '/keɪk/', 'This delicious cake smells so good!', 'Món bánh kem thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w02_cookie', 'food_l5', 'cookie', 'bánh quy', '/ˈkʊk.i/', 'This delicious cookie smells so good!', 'Món bánh quy thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w03_ice_cream', 'food_l5', 'ice cream', 'kem que', '/ˌaɪs ˈkriːm/', 'This delicious ice cream smells so good!', 'Món kem que thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w04_candy', 'food_l5', 'candy', 'kẹo ngọt', '/ˈkæn.di/', 'This delicious candy smells so good!', 'Món kẹo ngọt thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w05_pudding', 'food_l5', 'pudding', 'bánh pudding', '/ˈpʊd.ɪŋ/', 'This delicious pudding smells so good!', 'Món bánh pudding thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w06_donut', 'food_l5', 'donut', 'bánh vòng', '/ˈdəʊ.nʌt/', 'This delicious donut smells so good!', 'Món bánh vòng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w07_pie', 'food_l5', 'pie', 'bánh nướng nhân', '/paɪ/', 'This delicious pie smells so good!', 'Món bánh nướng nhân thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w08_muffin', 'food_l5', 'muffin', 'bánh xốp nhỏ', '/ˈmʌf.ɪn/', 'This delicious muffin smells so good!', 'Món bánh xốp nhỏ thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w09_chocolate', 'food_l5', 'chocolate', 'sô-cô-la', '/ˈtʃɒk.lət/', 'This delicious chocolate smells so good!', 'Món sô-cô-la thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l05_w10_lollipop', 'food_l5', 'lollipop', 'kẹo mút', '/ˈlɒl.i.pɒp/', 'This delicious lollipop smells so good!', 'Món kẹo mút thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w01_pizza', 'food_l6', 'pizza', 'bánh pizza', '/ˈpiːt.sə/', 'This delicious pizza smells so good!', 'Món bánh pizza thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w02_burger', 'food_l6', 'burger', 'bánh kẹp thịt', '/ˈbɜː.ɡər/', 'This delicious burger smells so good!', 'Món bánh kẹp thịt thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w03_french_fries', 'food_l6', 'french fries', 'khoai tây chiên', '/frentʃ fraɪz/', 'This delicious french fries smells so good!', 'Món khoai tây chiên thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w04_popcorn', 'food_l6', 'popcorn', 'bỏng ngô', '/ˈpɒp.kɔːn/', 'This delicious popcorn smells so good!', 'Món bỏng ngô thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w05_hot_dog', 'food_l6', 'hot dog', 'bánh mì kẹp xúc xích', '/ˈhɒt dɒɡ/', 'This delicious hot dog smells so good!', 'Món bánh mì kẹp xúc xích thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w06_biscuit', 'food_l6', 'biscuit', 'bánh bích quy', '/ˈbɪs.kɪt/', 'This delicious biscuit smells so good!', 'Món bánh bích quy thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w07_pretzel', 'food_l6', 'pretzel', 'bánh quy xoắn', '/ˈpret.səl/', 'This delicious pretzel smells so good!', 'Món bánh quy xoắn thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w08_chips', 'food_l6', 'chips', 'khoai tây lát mỏng', '/tʃɪps/', 'This delicious chips smells so good!', 'Món khoai tây lát mỏng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w09_taco', 'food_l6', 'taco', 'bánh taco', '/ˈtæk.əʊ/', 'This delicious taco smells so good!', 'Món bánh taco thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l06_w10_pasta', 'food_l6', 'pasta', 'mì Ý sốt', '/ˈpæs.tə/', 'This delicious pasta smells so good!', 'Món mì Ý sốt thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w01_plate', 'food_l7', 'plate', 'cái đĩa', '/pleɪt/', 'This delicious plate smells so good!', 'Món cái đĩa thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w02_bowl', 'food_l7', 'bowl', 'cái bát / tô', '/bəʊl/', 'This delicious bowl smells so good!', 'Món cái bát / tô thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w03_spoon', 'food_l7', 'spoon', 'chiếc thìa', '/spuːn/', 'This delicious spoon smells so good!', 'Món chiếc thìa thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w04_fork', 'food_l7', 'fork', 'chiếc dĩa', '/fɔːk/', 'This delicious fork smells so good!', 'Món chiếc dĩa thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w05_knife', 'food_l7', 'knife', 'con dao ăn', '/naɪf/', 'This delicious knife smells so good!', 'Món con dao ăn thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w06_cup', 'food_l7', 'cup', 'cái tách nhỏ', '/kʌp/', 'This delicious cup smells so good!', 'Món cái tách nhỏ thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w07_glass', 'food_l7', 'glass', 'cốc thủy tinh', '/ɡlɑːs/', 'This delicious glass smells so good!', 'Món cốc thủy tinh thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w08_napkin', 'food_l7', 'napkin', 'khăn ăn', '/ˈnæp.kɪn/', 'This delicious napkin smells so good!', 'Món khăn ăn thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w09_chopsticks', 'food_l7', 'chopsticks', 'đôi đũa', '/ˈtʃɒp.stɪks/', 'This delicious chopsticks smells so good!', 'Món đôi đũa thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l07_w10_tray', 'food_l7', 'tray', 'chiếc khay', '/treɪ/', 'This delicious tray smells so good!', 'Món chiếc khay thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w01_cook', 'food_l8', 'cook', 'nấu ăn', '/kʊk/', 'This delicious cook smells so good!', 'Món nấu ăn thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w02_bake', 'food_l8', 'bake', 'nướng bánh', '/beɪk/', 'This delicious bake smells so good!', 'Món nướng bánh thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w03_boil', 'food_l8', 'boil', 'luộc chín', '/bɔɪl/', 'This delicious boil smells so good!', 'Món luộc chín thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w04_fry', 'food_l8', 'fry', 'chiên / rán', '/fraɪ/', 'This delicious fry smells so good!', 'Món chiên / rán thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w05_cut', 'food_l8', 'cut', 'cắt thái', '/kʌt/', 'This delicious cut smells so good!', 'Món cắt thái thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w06_mix', 'food_l8', 'mix', 'trộn đều', '/mɪks/', 'This delicious mix smells so good!', 'Món trộn đều thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w07_pour', 'food_l8', 'pour', 'rót nước', '/pɔːr/', 'This delicious pour smells so good!', 'Món rót nước thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w08_stir', 'food_l8', 'stir', 'khuấy nhẹ', '/stɜːr/', 'This delicious stir smells so good!', 'Món khuấy nhẹ thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w09_taste', 'food_l8', 'taste', 'nếm thử', '/teɪst/', 'This delicious taste smells so good!', 'Món nếm thử thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l08_w10_serve', 'food_l8', 'serve', 'bày biện món', '/sɜːv/', 'This delicious serve smells so good!', 'Món bày biện món thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w01_hot', 'food_l9', 'hot', 'nóng sốt', '/hɒt/', 'This delicious hot smells so good!', 'Món nóng sốt thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w02_cold', 'food_l9', 'cold', 'mát lạnh', '/kəʊld/', 'This delicious cold smells so good!', 'Món mát lạnh thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w03_sweet', 'food_l9', 'sweet', 'ngọt lịm', '/swiːt/', 'This delicious sweet smells so good!', 'Món ngọt lịm thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w04_salty', 'food_l9', 'salty', 'mặn mà', '/ˈsɒl.ti/', 'This delicious salty smells so good!', 'Món mặn mà thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w05_spicy', 'food_l9', 'spicy', 'cay nồng', '/ˈspaɪ.si/', 'This delicious spicy smells so good!', 'Món cay nồng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w06_sour', 'food_l9', 'sour', 'chua chua', '/saʊər/', 'This delicious sour smells so good!', 'Món chua chua thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w07_yummy', 'food_l9', 'yummy', 'ngon tuyệt cú mèo', '/ˈjʌm.i/', 'This delicious yummy smells so good!', 'Món ngon tuyệt cú mèo thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w08_warm', 'food_l9', 'warm', 'ấm áp', '/wɔːm/', 'This delicious warm smells so good!', 'Món ấm áp thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w09_crunchy', 'food_l9', 'crunchy', 'giòn tan', '/ˈkrʌn.tʃi/', 'This delicious crunchy smells so good!', 'Món giòn tan thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l09_w10_fresh', 'food_l9', 'fresh', 'tươi ngon', '/freʃ/', 'This delicious fresh smells so good!', 'Món tươi ngon thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w01_healthy', 'food_l10', 'healthy', 'lành mạnh', '/ˈhel.θi/', 'This delicious healthy smells so good!', 'Món lành mạnh thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w02_hungry', 'food_l10', 'hungry', 'đói bụng', '/ˈhʌŋ.ɡri/', 'This delicious hungry smells so good!', 'Món đói bụng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w03_full', 'food_l10', 'full', 'no nê', '/fʊl/', 'This delicious full smells so good!', 'Món no nê thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w04_chew', 'food_l10', 'chew', 'nhai kỹ', '/tʃuː/', 'This delicious chew smells so good!', 'Món nhai kỹ thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w05_swallow', 'food_l10', 'swallow', 'nuốt êm', '/ˈswɒl.əʊ/', 'This delicious swallow smells so good!', 'Món nuốt êm thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w06_diet', 'food_l10', 'diet', 'chế độ dinh dưỡng', '/ˈdaɪ.ət/', 'This delicious diet smells so good!', 'Món chế độ dinh dưỡng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w07_vitamin', 'food_l10', 'vitamin', 'vi-ta-min', '/ˈvɪt.ə.mɪn/', 'This delicious vitamin smells so good!', 'Món vi-ta-min thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w08_energy', 'food_l10', 'energy', 'năng lượng', '/ˈen.ə.dʒi/', 'This delicious energy smells so good!', 'Món năng lượng thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w09_portion', 'food_l10', 'portion', 'khẩu phần ăn', '/ˈpɔː.ʃən/', 'This delicious portion smells so good!', 'Món khẩu phần ăn thơm lừng và ngon miệng này thật tuyệt vời!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('food_l10_w10_water_drink', 'food_l10', 'water drink', 'uống đủ nước', '/ˈwɔː.tər drɪŋk/', 'I drink fresh water drink every morning.', 'Bé uống uống đủ nước thơm ngon vào mỗi buổi sáng.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w01_eye', 'body_l1', 'eye', 'mắt', '/aɪ/', 'Touch your eye gently and count with Dino!', 'Bé hãy chạm nhẹ vào mắt và đếm cùng Dino nào!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w02_nose', 'body_l1', 'nose', 'mũi', '/nəʊz/', 'We should keep our nose clean and healthy.', 'Bé luôn giữ gìn mũi sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w03_mouth', 'body_l1', 'mouth', 'miệng', '/maʊθ/', 'We should keep our mouth clean and healthy.', 'Bé luôn giữ gìn miệng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w04_ear', 'body_l1', 'ear', 'tai', '/ɪər/', 'Touch your ear gently and count with Dino!', 'Bé hãy chạm nhẹ vào tai và đếm cùng Dino nào!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w05_head', 'body_l1', 'head', 'đầu', '/hed/', 'We should keep our head clean and healthy.', 'Bé luôn giữ gìn đầu sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w06_hair', 'body_l1', 'hair', 'mái tóc', '/heər/', 'We should keep our hair clean and healthy.', 'Bé luôn giữ gìn mái tóc sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w07_tooth', 'body_l1', 'tooth', 'chiếc răng', '/tuːθ/', 'We should keep our tooth clean and healthy.', 'Bé luôn giữ gìn chiếc răng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w08_tongue', 'body_l1', 'tongue', 'lưỡi', '/tʌŋ/', 'We should keep our tongue clean and healthy.', 'Bé luôn giữ gìn lưỡi sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w09_cheek', 'body_l1', 'cheek', 'đôi má', '/tʃiːk/', 'We should keep our cheek clean and healthy.', 'Bé luôn giữ gìn đôi má sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l01_w10_chin', 'body_l1', 'chin', 'chiếc cằm', '/tʃɪn/', 'We should keep our chin clean and healthy.', 'Bé luôn giữ gìn chiếc cằm sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w01_arm', 'body_l2', 'arm', 'cánh tay', '/ɑːm/', 'Touch your arm gently and count with Dino!', 'Bé hãy chạm nhẹ vào cánh tay và đếm cùng Dino nào!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w02_hand', 'body_l2', 'hand', 'bàn tay', '/hænd/', 'Touch your hand gently and count with Dino!', 'Bé hãy chạm nhẹ vào bàn tay và đếm cùng Dino nào!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w03_finger', 'body_l2', 'finger', 'ngón tay', '/ˈfɪŋ.ɡər/', 'We should keep our finger clean and healthy.', 'Bé luôn giữ gìn ngón tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w04_thumb', 'body_l2', 'thumb', 'ngón tay cái', '/θʌm/', 'We should keep our thumb clean and healthy.', 'Bé luôn giữ gìn ngón tay cái sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w05_shoulder', 'body_l2', 'shoulder', 'bờ vai', '/ˈʃəʊl.dər/', 'We should keep our shoulder clean and healthy.', 'Bé luôn giữ gìn bờ vai sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w06_elbow', 'body_l2', 'elbow', 'khuỷu tay', '/ˈel.bəʊ/', 'We should keep our elbow clean and healthy.', 'Bé luôn giữ gìn khuỷu tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w07_wrist', 'body_l2', 'wrist', 'cổ tay', '/rɪst/', 'We should keep our wrist clean and healthy.', 'Bé luôn giữ gìn cổ tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w08_chest', 'body_l2', 'chest', 'lồng ngực', '/tʃest/', 'We should keep our chest clean and healthy.', 'Bé luôn giữ gìn lồng ngực sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w09_neck', 'body_l2', 'neck', 'cổ', '/nek/', 'We should keep our neck clean and healthy.', 'Bé luôn giữ gìn cổ sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l02_w10_throat', 'body_l2', 'throat', 'họng', '/θrəʊt/', 'We should keep our throat clean and healthy.', 'Bé luôn giữ gìn họng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w01_leg', 'body_l3', 'leg', 'đôi chân', '/leɡ/', 'Touch your leg gently and count with Dino!', 'Bé hãy chạm nhẹ vào đôi chân và đếm cùng Dino nào!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w02_foot', 'body_l3', 'foot', 'bàn chân', '/fʊt/', 'Touch your foot gently and count with Dino!', 'Bé hãy chạm nhẹ vào bàn chân và đếm cùng Dino nào!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w03_toe', 'body_l3', 'toe', 'ngón chân', '/təʊ/', 'We should keep our toe clean and healthy.', 'Bé luôn giữ gìn ngón chân sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w04_knee', 'body_l3', 'knee', 'đầu gối', '/niː/', 'We should keep our knee clean and healthy.', 'Bé luôn giữ gìn đầu gối sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w05_ankle', 'body_l3', 'ankle', 'mắt cá chân', '/ˈæŋ.kəl/', 'We should keep our ankle clean and healthy.', 'Bé luôn giữ gìn mắt cá chân sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w06_heel', 'body_l3', 'heel', 'gót chân', '/hiːl/', 'We should keep our heel clean and healthy.', 'Bé luôn giữ gìn gót chân sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w07_hip', 'body_l3', 'hip', 'hông', '/hɪp/', 'We should keep our hip clean and healthy.', 'Bé luôn giữ gìn hông sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w08_thigh', 'body_l3', 'thigh', 'bắp đùi', '/θaɪ/', 'We should keep our thigh clean and healthy.', 'Bé luôn giữ gìn bắp đùi sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w09_shin', 'body_l3', 'shin', 'cẳng chân', '/ʃɪn/', 'We should keep our shin clean and healthy.', 'Bé luôn giữ gìn cẳng chân sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l03_w10_calf', 'body_l3', 'calf', 'bắp chuối chân', '/kɑːf/', 'We should keep our calf clean and healthy.', 'Bé luôn giữ gìn bắp chuối chân sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w01_see', 'body_l4', 'see', 'nhìn thấy', '/siː/', 'We should keep our see clean and healthy.', 'Bé luôn giữ gìn nhìn thấy sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w02_hear', 'body_l4', 'hear', 'lắng nghe', '/hɪər/', 'Touch your hear gently and count with Dino!', 'Bé hãy chạm nhẹ vào lắng nghe và đếm cùng Dino nào!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w03_smell', 'body_l4', 'smell', 'ngửi mùi', '/smel/', 'We should keep our smell clean and healthy.', 'Bé luôn giữ gìn ngửi mùi sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w04_taste', 'body_l4', 'taste', 'nếm vị', '/teɪst/', 'We should keep our taste clean and healthy.', 'Bé luôn giữ gìn nếm vị sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w05_touch', 'body_l4', 'touch', 'chạm vào', '/tʌtʃ/', 'We should keep our touch clean and healthy.', 'Bé luôn giữ gìn chạm vào sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w06_look', 'body_l4', 'look', 'quan sát', '/lʊk/', 'We should keep our look clean and healthy.', 'Bé luôn giữ gìn quan sát sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w07_listen', 'body_l4', 'listen', 'chăm chú nghe', '/ˈlɪs.ən/', 'We should keep our listen clean and healthy.', 'Bé luôn giữ gìn chăm chú nghe sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w08_sniff', 'body_l4', 'sniff', 'hít thở hương', '/snɪf/', 'We should keep our sniff clean and healthy.', 'Bé luôn giữ gìn hít thở hương sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w09_feel', 'body_l4', 'feel', 'cảm nhận', '/fiːl/', 'We should keep our feel clean and healthy.', 'Bé luôn giữ gìn cảm nhận sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l04_w10_sense', 'body_l4', 'sense', 'giác quan', '/sens/', 'We should keep our sense clean and healthy.', 'Bé luôn giữ gìn giác quan sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w01_walk', 'body_l5', 'walk', 'bước đi', '/wɔːk/', 'We should keep our walk clean and healthy.', 'Bé luôn giữ gìn bước đi sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w02_run', 'body_l5', 'run', 'chạy nhanh', '/rʌn/', 'We should keep our run clean and healthy.', 'Bé luôn giữ gìn chạy nhanh sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w03_jump', 'body_l5', 'jump', 'nhảy cao', '/dʒʌmp/', 'We should keep our jump clean and healthy.', 'Bé luôn giữ gìn nhảy cao sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w04_clap', 'body_l5', 'clap', 'vỗ tay', '/klæp/', 'We should keep our clap clean and healthy.', 'Bé luôn giữ gìn vỗ tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w05_blink', 'body_l5', 'blink', 'chớp mắt', '/blɪŋk/', 'We should keep our blink clean and healthy.', 'Bé luôn giữ gìn chớp mắt sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w06_nod', 'body_l5', 'nod', 'gật đầu', '/nɒd/', 'We should keep our nod clean and healthy.', 'Bé luôn giữ gìn gật đầu sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w07_wave', 'body_l5', 'wave', 'vẫy tay', '/weɪv/', 'We should keep our wave clean and healthy.', 'Bé luôn giữ gìn vẫy tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w08_kick', 'body_l5', 'kick', 'đá bóng', '/kɪk/', 'We should keep our kick clean and healthy.', 'Bé luôn giữ gìn đá bóng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w09_point', 'body_l5', 'point', 'chỉ tay', '/pɔɪnt/', 'We should keep our point clean and healthy.', 'Bé luôn giữ gìn chỉ tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l05_w10_stomp', 'body_l5', 'stomp', 'giậm chân', '/stɒmp/', 'We should keep our stomp clean and healthy.', 'Bé luôn giữ gìn giậm chân sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w01_heart', 'body_l6', 'heart', 'trái tim', '/hɑːt/', 'Touch your heart gently and count with Dino!', 'Bé hãy chạm nhẹ vào trái tim và đếm cùng Dino nào!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w02_bone', 'body_l6', 'bone', 'xương', '/bəʊn/', 'We should keep our bone clean and healthy.', 'Bé luôn giữ gìn xương sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w03_muscle', 'body_l6', 'muscle', 'cơ bắp', '/ˈmʌs.əl/', 'We should keep our muscle clean and healthy.', 'Bé luôn giữ gìn cơ bắp sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w04_brain', 'body_l6', 'brain', 'não bộ', '/breɪn/', 'We should keep our brain clean and healthy.', 'Bé luôn giữ gìn não bộ sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w05_stomach', 'body_l6', 'stomach', 'dạ dày', '/ˈstʌm.ək/', 'We should keep our stomach clean and healthy.', 'Bé luôn giữ gìn dạ dày sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w06_blood', 'body_l6', 'blood', 'mạch máu', '/blʌd/', 'We should keep our blood clean and healthy.', 'Bé luôn giữ gìn mạch máu sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w07_lung', 'body_l6', 'lung', 'lá phổi', '/lʌŋ/', 'We should keep our lung clean and healthy.', 'Bé luôn giữ gìn lá phổi sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w08_spine', 'body_l6', 'spine', 'cột sống', '/spaɪn/', 'We should keep our spine clean and healthy.', 'Bé luôn giữ gìn cột sống sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w09_rib', 'body_l6', 'rib', 'xương sườn', '/rɪb/', 'We should keep our rib clean and healthy.', 'Bé luôn giữ gìn xương sườn sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l06_w10_breath', 'body_l6', 'breath', 'hơi thở', '/breθ/', 'We should keep our breath clean and healthy.', 'Bé luôn giữ gìn hơi thở sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w01_wash', 'body_l7', 'wash', 'rửa sạch', '/wɒʃ/', 'We should keep our wash clean and healthy.', 'Bé luôn giữ gìn rửa sạch sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w02_brush', 'body_l7', 'brush', 'chải răng', '/brʌʃ/', 'We should keep our brush clean and healthy.', 'Bé luôn giữ gìn chải răng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w03_clean', 'body_l7', 'clean', 'giữ sạch sẽ', '/kliːn/', 'We should keep our clean clean and healthy.', 'Bé luôn giữ gìn giữ sạch sẽ sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w04_soap', 'body_l7', 'soap', 'xà bông', '/səʊp/', 'We should keep our soap clean and healthy.', 'Bé luôn giữ gìn xà bông sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w05_towel', 'body_l7', 'towel', 'khăn lau', '/taʊəl/', 'We should keep our towel clean and healthy.', 'Bé luôn giữ gìn khăn lau sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w06_sleep', 'body_l7', 'sleep', 'ngủ sâu', '/sliːp/', 'We should keep our sleep clean and healthy.', 'Bé luôn giữ gìn ngủ sâu sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w07_rest', 'body_l7', 'rest', 'nghỉ ngơi', '/rest/', 'We should keep our rest clean and healthy.', 'Bé luôn giữ gìn nghỉ ngơi sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w08_healthy', 'body_l7', 'healthy', 'khỏe mạnh', '/ˈhel.θi/', 'We should keep our healthy clean and healthy.', 'Bé luôn giữ gìn khỏe mạnh sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w09_strong', 'body_l7', 'strong', 'vững vàng', '/strɒŋ/', 'We should keep our strong clean and healthy.', 'Bé luôn giữ gìn vững vàng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l07_w10_bath', 'body_l7', 'bath', 'tắm mát', '/bɑːθ/', 'We should keep our bath clean and healthy.', 'Bé luôn giữ gìn tắm mát sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w01_tired', 'body_l8', 'tired', 'mỏi mệt', '/taɪəd/', 'We should keep our tired clean and healthy.', 'Bé luôn giữ gìn mỏi mệt sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w02_sleepy', 'body_l8', 'sleepy', 'buồn ngủ', '/ˈsliː.pi/', 'We should keep our sleepy clean and healthy.', 'Bé luôn giữ gìn buồn ngủ sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w03_energetic', 'body_l8', 'energetic', 'tràn đầy sức sống', '/ˌen.əˈdʒet.ɪk/', 'We should keep our energetic clean and healthy.', 'Bé luôn giữ gìn tràn đầy sức sống sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w04_warm', 'body_l8', 'warm', 'ấm áp', '/wɔːm/', 'Touch your warm gently and count with Dino!', 'Bé hãy chạm nhẹ vào ấm áp và đếm cùng Dino nào!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w05_chilly', 'body_l8', 'chilly', 'se lạnh', '/ˈtʃɪl.i/', 'We should keep our chilly clean and healthy.', 'Bé luôn giữ gìn se lạnh sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w06_thirsty', 'body_l8', 'thirsty', 'khát nước', '/ˈθɜː.sti/', 'We should keep our thirsty clean and healthy.', 'Bé luôn giữ gìn khát nước sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w07_hungry', 'body_l8', 'hungry', 'đói bụng', '/ˈhʌŋ.ɡri/', 'We should keep our hungry clean and healthy.', 'Bé luôn giữ gìn đói bụng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w08_tickle', 'body_l8', 'tickle', 'nhột nhột', '/ˈtɪk.əl/', 'We should keep our tickle clean and healthy.', 'Bé luôn giữ gìn nhột nhột sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w09_relaxed', 'body_l8', 'relaxed', 'thư giãn', '/rɪˈlækst/', 'We should keep our relaxed clean and healthy.', 'Bé luôn giữ gìn thư giãn sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l08_w10_dizzy', 'body_l8', 'dizzy', 'choáng ngợp', '/ˈdɪz.i/', 'We should keep our dizzy clean and healthy.', 'Bé luôn giữ gìn choáng ngợp sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w01_tall', 'body_l9', 'tall', 'cao lớn', '/tɔːl/', 'We should keep our tall clean and healthy.', 'Bé luôn giữ gìn cao lớn sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w02_short', 'body_l9', 'short', 'nhỏ nhắn', '/ʃɔːt/', 'We should keep our short clean and healthy.', 'Bé luôn giữ gìn nhỏ nhắn sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w03_grow', 'body_l9', 'grow', 'lớn lên', '/ɡrəʊ/', 'We should keep our grow clean and healthy.', 'Bé luôn giữ gìn lớn lên sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w04_strong', 'body_l9', 'strong', 'khỏe khoắn', '/strɒŋ/', 'We should keep our strong clean and healthy.', 'Bé luôn giữ gìn khỏe khoắn sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w05_fast', 'body_l9', 'fast', 'nhanh nhẹn', '/fɑːst/', 'We should keep our fast clean and healthy.', 'Bé luôn giữ gìn nhanh nhẹn sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w06_gentle', 'body_l9', 'gentle', 'nhẹ nhàng', '/ˈdʒen.təl/', 'We should keep our gentle clean and healthy.', 'Bé luôn giữ gìn nhẹ nhàng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w07_heavy', 'body_l9', 'heavy', 'nặng cân', '/ˈhev.i/', 'We should keep our heavy clean and healthy.', 'Bé luôn giữ gìn nặng cân sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w08_light', 'body_l9', 'light', 'nhẹ tênh', '/laɪt/', 'We should keep our light clean and healthy.', 'Bé luôn giữ gìn nhẹ tênh sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w09_stretch', 'body_l9', 'stretch', 'vươn vai', '/stretʃ/', 'We should keep our stretch clean and healthy.', 'Bé luôn giữ gìn vươn vai sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l09_w10_bend', 'body_l9', 'bend', 'cúi gập người', '/bend/', 'We should keep our bend clean and healthy.', 'Bé luôn giữ gìn cúi gập người sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w01_comb', 'body_l10', 'comb', 'cái lược', '/kəʊm/', 'We should keep our comb clean and healthy.', 'Bé luôn giữ gìn cái lược sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w02_toothbrush', 'body_l10', 'toothbrush', 'bàn chải răng', '/ˈtuːθ.brʌʃ/', 'We should keep our toothbrush clean and healthy.', 'Bé luôn giữ gìn bàn chải răng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w03_shampoo', 'body_l10', 'shampoo', 'dầu gội đầu', '/ʃæmˈpuː/', 'We should keep our shampoo clean and healthy.', 'Bé luôn giữ gìn dầu gội đầu sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w04_tissue', 'body_l10', 'tissue', 'khăn giấy', '/ˈtɪʃ.uː/', 'We should keep our tissue clean and healthy.', 'Bé luôn giữ gìn khăn giấy sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w05_sanitize', 'body_l10', 'sanitize', 'sát khuẩn tay', '/ˈsæn.ɪ.taɪz/', 'We should keep our sanitize clean and healthy.', 'Bé luôn giữ gìn sát khuẩn tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w06_shower', 'body_l10', 'shower', 'vòi sen tắm', '/ʃaʊər/', 'We should keep our shower clean and healthy.', 'Bé luôn giữ gìn vòi sen tắm sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w07_dry', 'body_l10', 'dry', 'lau khô', '/draɪ/', 'We should keep our dry clean and healthy.', 'Bé luôn giữ gìn lau khô sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w08_trim', 'body_l10', 'trim', 'cắt tỉa móng', '/trɪm/', 'We should keep our trim clean and healthy.', 'Bé luôn giữ gìn cắt tỉa móng sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w09_clip', 'body_l10', 'clip', 'bấm móng tay', '/klɪp/', 'We should keep our clip clean and healthy.', 'Bé luôn giữ gìn bấm móng tay sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('body_l10_w10_wipe', 'body_l10', 'wipe', 'lau sạch sẽ', '/waɪp/', 'We should keep our wipe clean and healthy.', 'Bé luôn giữ gìn lau sạch sẽ sạch sẽ và khỏe mạnh mỗi ngày.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w01_pencil', 'school_l1', 'pencil', 'bút chì', '/ˈpen.səl/', 'I bring my new pencil to school today.', 'Hôm nay bé mang theo bút chì mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w02_pen', 'school_l1', 'pen', 'bút mực', '/pen/', 'I bring my new pen to school today.', 'Hôm nay bé mang theo bút mực mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w03_book', 'school_l1', 'book', 'sách giáo khoa', '/bʊk/', 'I bring my new book to school today.', 'Hôm nay bé mang theo sách giáo khoa mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w04_notebook', 'school_l1', 'notebook', 'vở viết', '/ˈnəʊt.bʊk/', 'I bring my new notebook to school today.', 'Hôm nay bé mang theo vở viết mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w05_eraser', 'school_l1', 'eraser', 'cục tẩy', '/ɪˈreɪ.zər/', 'I bring my new eraser to school today.', 'Hôm nay bé mang theo cục tẩy mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w06_ruler', 'school_l1', 'ruler', 'thước kẻ', '/ˈruː.lər/', 'I bring my new ruler to school today.', 'Hôm nay bé mang theo thước kẻ mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w07_desk', 'school_l1', 'desk', 'bàn học', '/desk/', 'I bring my new desk to school today.', 'Hôm nay bé mang theo bàn học mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w08_chair', 'school_l1', 'chair', 'chiếc ghế', '/tʃeər/', 'I bring my new chair to school today.', 'Hôm nay bé mang theo chiếc ghế mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w09_schoolbag', 'school_l1', 'schoolbag', 'cặp sách', '/ˈskuːl.bæɡ/', 'I bring my new schoolbag to school today.', 'Hôm nay bé mang theo cặp sách mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l01_w10_paper', 'school_l1', 'paper', 'tờ giấy', '/ˈpeɪ.pər/', 'I bring my new paper to school today.', 'Hôm nay bé mang theo tờ giấy mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w01_crayon', 'school_l2', 'crayon', 'sáp màu', '/ˈkreɪ.ɒn/', 'I bring my new crayon to school today.', 'Hôm nay bé mang theo sáp màu mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w02_marker', 'school_l2', 'marker', 'bút dạ', '/ˈmɑː.kər/', 'I bring my new marker to school today.', 'Hôm nay bé mang theo bút dạ mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w03_scissors', 'school_l2', 'scissors', 'cây kéo', '/ˈsɪz.əz/', 'I bring my new scissors to school today.', 'Hôm nay bé mang theo cây kéo mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w04_glue', 'school_l2', 'glue', 'hồ dán', '/ɡluː/', 'I bring my new glue to school today.', 'Hôm nay bé mang theo hồ dán mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w05_paintbrush', 'school_l2', 'paintbrush', 'cọ vẽ', '/ˈpeɪnt.brʌʃ/', 'I bring my new paintbrush to school today.', 'Hôm nay bé mang theo cọ vẽ mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w06_paint', 'school_l2', 'paint', 'hộp màu vẽ', '/peɪnt/', 'I bring my new paint to school today.', 'Hôm nay bé mang theo hộp màu vẽ mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w07_colored_pencil', 'school_l2', 'colored pencil', 'chì màu', '/ˈkʌl.əd ˈpen.səl/', 'I bring my new colored pencil to school today.', 'Hôm nay bé mang theo chì màu mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w08_clay', 'school_l2', 'clay', 'đất nặn', '/kleɪ/', 'I bring my new clay to school today.', 'Hôm nay bé mang theo đất nặn mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w09_tape', 'school_l2', 'tape', 'băng dính', '/teɪp/', 'I bring my new tape to school today.', 'Hôm nay bé mang theo băng dính mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l02_w10_folder', 'school_l2', 'folder', 'kẹp hồ sơ', '/ˈfəʊl.dər/', 'I bring my new folder to school today.', 'Hôm nay bé mang theo kẹp hồ sơ mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w01_teacher', 'school_l3', 'teacher', 'thầy cô giáo', '/ˈtiː.tʃər/', 'I bring my new teacher to school today.', 'Hôm nay bé mang theo thầy cô giáo mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w02_student', 'school_l3', 'student', 'học sinh', '/ˈstjuː.dənt/', 'I bring my new student to school today.', 'Hôm nay bé mang theo học sinh mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w03_classmate', 'school_l3', 'classmate', 'bạn cùng lớp', '/ˈklɑːs.meɪt/', 'I bring my new classmate to school today.', 'Hôm nay bé mang theo bạn cùng lớp mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w04_friend', 'school_l3', 'friend', 'người bạn', '/frend/', 'I bring my new friend to school today.', 'Hôm nay bé mang theo người bạn mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w05_principal', 'school_l3', 'principal', 'thầy hiệu trưởng', '/ˈprɪn.sə.pəl/', 'I bring my new principal to school today.', 'Hôm nay bé mang theo thầy hiệu trưởng mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w06_nurse', 'school_l3', 'nurse', 'cô y tế', '/nɜːs/', 'I bring my new nurse to school today.', 'Hôm nay bé mang theo cô y tế mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w07_helper', 'school_l3', 'helper', 'bác bảo vệ', '/ˈhel.pər/', 'I bring my new helper to school today.', 'Hôm nay bé mang theo bác bảo vệ mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w08_monitor', 'school_l3', 'monitor', 'bạn lớp trưởng', '/ˈmɒn.ɪ.tər/', 'I bring my new monitor to school today.', 'Hôm nay bé mang theo bạn lớp trưởng mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w09_librarian', 'school_l3', 'librarian', 'cô thủ thư', '/laɪˈbreə.ri.ən/', 'I bring my new librarian to school today.', 'Hôm nay bé mang theo cô thủ thư mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l03_w10_driver', 'school_l3', 'driver', 'bác tài xế xe buýt', '/ˈdraɪ.vər/', 'I bring my new driver to school today.', 'Hôm nay bé mang theo bác tài xế xe buýt mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w01_classroom', 'school_l4', 'classroom', 'phòng học', '/ˈklɑːs.ruːm/', 'I bring my new classroom to school today.', 'Hôm nay bé mang theo phòng học mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w02_library', 'school_l4', 'library', 'thư viện', '/ˈlaɪ.brər.i/', 'I bring my new library to school today.', 'Hôm nay bé mang theo thư viện mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w03_playground', 'school_l4', 'playground', 'sân chơi', '/ˈpleɪ.ɡraʊnd/', 'I bring my new playground to school today.', 'Hôm nay bé mang theo sân chơi mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w04_canteen', 'school_l4', 'canteen', 'nhà ăn', '/kænˈtiːn/', 'I bring my new canteen to school today.', 'Hôm nay bé mang theo nhà ăn mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w05_gym', 'school_l4', 'gym', 'nhà thể chất', '/dʒɪm/', 'I bring my new gym to school today.', 'Hôm nay bé mang theo nhà thể chất mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w06_restroom', 'school_l4', 'restroom', 'nhà vệ sinh', '/ˈrest.ruːm/', 'I bring my new restroom to school today.', 'Hôm nay bé mang theo nhà vệ sinh mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w07_office', 'school_l4', 'office', 'văn phòng', '/ˈɒf.ɪs/', 'I bring my new office to school today.', 'Hôm nay bé mang theo văn phòng mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w08_gate', 'school_l4', 'gate', 'cổng trường', '/ɡeɪt/', 'I bring my new gate to school today.', 'Hôm nay bé mang theo cổng trường mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w09_hallway', 'school_l4', 'hallway', 'hành lang lớp', '/ˈhɔːl.weɪ/', 'I bring my new hallway to school today.', 'Hôm nay bé mang theo hành lang lớp mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l04_w10_stage', 'school_l4', 'stage', 'sân khấu', '/steɪdʒ/', 'I bring my new stage to school today.', 'Hôm nay bé mang theo sân khấu mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w01_english', 'school_l5', 'English', 'tiếng Anh', '/ˈɪŋ.ɡlɪʃ/', 'I bring my new english to school today.', 'Hôm nay bé mang theo tiếng Anh mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w02_math', 'school_l5', 'math', 'môn toán', '/mæθ/', 'I bring my new math to school today.', 'Hôm nay bé mang theo môn toán mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w03_science', 'school_l5', 'science', 'khoa học', '/ˈsaɪ.əns/', 'I bring my new science to school today.', 'Hôm nay bé mang theo khoa học mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w04_art', 'school_l5', 'art', 'mỹ thuật', '/ɑːt/', 'I bring my new art to school today.', 'Hôm nay bé mang theo mỹ thuật mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w05_music', 'school_l5', 'music', 'âm nhạc', '/ˈmjuː.zɪk/', 'I bring my new music to school today.', 'Hôm nay bé mang theo âm nhạc mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w06_sport', 'school_l5', 'sport', 'thể dục', '/spɔːt/', 'I bring my new sport to school today.', 'Hôm nay bé mang theo thể dục mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w07_reading', 'school_l5', 'reading', 'tập đọc', '/ˈriː.dɪŋ/', 'I bring my new reading to school today.', 'Hôm nay bé mang theo tập đọc mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w08_writing', 'school_l5', 'writing', 'tập viết', '/ˈraɪ.tɪŋ/', 'I bring my new writing to school today.', 'Hôm nay bé mang theo tập viết mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w09_history', 'school_l5', 'history', 'lịch sử', '/ˈhɪs.tər.i/', 'I bring my new history to school today.', 'Hôm nay bé mang theo lịch sử mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l05_w10_drama', 'school_l5', 'drama', 'kịch nghệ', '/ˈdrɑː.mə/', 'I bring my new drama to school today.', 'Hôm nay bé mang theo kịch nghệ mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w01_listen', 'school_l6', 'listen', 'chú ý nghe', '/ˈlɪs.ən/', 'I bring my new listen to school today.', 'Hôm nay bé mang theo chú ý nghe mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w02_read', 'school_l6', 'read', 'đọc bài', '/riːd/', 'I bring my new read to school today.', 'Hôm nay bé mang theo đọc bài mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w03_write', 'school_l6', 'write', 'viết chữ', '/raɪt/', 'I bring my new write to school today.', 'Hôm nay bé mang theo viết chữ mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w04_draw', 'school_l6', 'draw', 'vẽ hình', '/drɔː/', 'I bring my new draw to school today.', 'Hôm nay bé mang theo vẽ hình mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w05_count', 'school_l6', 'count', 'đếm số', '/kaʊnt/', 'I bring my new count to school today.', 'Hôm nay bé mang theo đếm số mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w06_raise_hand', 'school_l6', 'raise hand', 'giơ tay phát biểu', '/reɪz hænd/', 'I bring my new raise hand to school today.', 'Hôm nay bé mang theo giơ tay phát biểu mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w07_sit_down', 'school_l6', 'sit down', 'ngồi ngay ngắn', '/sɪt daʊn/', 'I bring my new sit down to school today.', 'Hôm nay bé mang theo ngồi ngay ngắn mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w08_stand_up', 'school_l6', 'stand up', 'đứng dậy', '/stænd ʌp/', 'I bring my new stand up to school today.', 'Hôm nay bé mang theo đứng dậy mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w09_speak', 'school_l6', 'speak', 'phát biểu', '/spiːk/', 'I bring my new speak to school today.', 'Hôm nay bé mang theo phát biểu mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l06_w10_learn', 'school_l6', 'learn', 'học hỏi', '/lɜːn/', 'I bring my new learn to school today.', 'Hôm nay bé mang theo học hỏi mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w01_circle', 'school_l7', 'circle', 'hình tròn', '/ˈsɜː.kəl/', 'I bring my new circle to school today.', 'Hôm nay bé mang theo hình tròn mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w02_square', 'school_l7', 'square', 'hình vuông', '/skweər/', 'I bring my new square to school today.', 'Hôm nay bé mang theo hình vuông mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w03_triangle', 'school_l7', 'triangle', 'hình tam giác', '/ˈtraɪ.æŋ.ɡəl/', 'I bring my new triangle to school today.', 'Hôm nay bé mang theo hình tam giác mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w04_rectangle', 'school_l7', 'rectangle', 'hình chữ nhật', '/ˈrek.tæŋ.ɡəl/', 'I bring my new rectangle to school today.', 'Hôm nay bé mang theo hình chữ nhật mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w05_star', 'school_l7', 'star', 'hình ngôi sao', '/stɑːr/', 'I bring my new star to school today.', 'Hôm nay bé mang theo hình ngôi sao mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w06_heart', 'school_l7', 'heart', 'hình trái tim', '/hɑːt/', 'I bring my new heart to school today.', 'Hôm nay bé mang theo hình trái tim mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w07_oval', 'school_l7', 'oval', 'hình bầu dục', '/ˈəʊ.vəl/', 'I bring my new oval to school today.', 'Hôm nay bé mang theo hình bầu dục mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w08_diamond', 'school_l7', 'diamond', 'hình thoi', '/ˈdaɪə.mənd/', 'I bring my new diamond to school today.', 'Hôm nay bé mang theo hình thoi mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w09_line', 'school_l7', 'line', 'đường thẳng', '/laɪn/', 'I bring my new line to school today.', 'Hôm nay bé mang theo đường thẳng mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l07_w10_dot', 'school_l7', 'dot', 'dấu chấm tròn', '/dɒt/', 'I bring my new dot to school today.', 'Hôm nay bé mang theo dấu chấm tròn mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w01_one', 'school_l8', 'one', 'số một', '/wʌn/', 'I bring my new one to school today.', 'Hôm nay bé mang theo số một mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w02_two', 'school_l8', 'two', 'số hai', '/tuː/', 'I bring my new two to school today.', 'Hôm nay bé mang theo số hai mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w03_three', 'school_l8', 'three', 'số ba', '/θriː/', 'I bring my new three to school today.', 'Hôm nay bé mang theo số ba mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w04_four', 'school_l8', 'four', 'số bốn', '/fɔːr/', 'I bring my new four to school today.', 'Hôm nay bé mang theo số bốn mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w05_five', 'school_l8', 'five', 'số năm', '/faɪv/', 'I bring my new five to school today.', 'Hôm nay bé mang theo số năm mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w06_six', 'school_l8', 'six', 'số sáu', '/sɪks/', 'I bring my new six to school today.', 'Hôm nay bé mang theo số sáu mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w07_seven', 'school_l8', 'seven', 'số bảy', '/ˈsev.ən/', 'I bring my new seven to school today.', 'Hôm nay bé mang theo số bảy mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w08_eight', 'school_l8', 'eight', 'số tám', '/eɪt/', 'I bring my new eight to school today.', 'Hôm nay bé mang theo số tám mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w09_nine', 'school_l8', 'nine', 'số chín', '/naɪn/', 'I bring my new nine to school today.', 'Hôm nay bé mang theo số chín mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l08_w10_ten', 'school_l8', 'ten', 'số mười', '/ten/', 'I bring my new ten to school today.', 'Hôm nay bé mang theo số mười mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w01_recess', 'school_l9', 'recess', 'giờ ra chơi', '/rɪˈses/', 'I bring my new recess to school today.', 'Hôm nay bé mang theo giờ ra chơi mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w02_game', 'school_l9', 'game', 'trò chơi', '/ɡeɪm/', 'I bring my new game to school today.', 'Hôm nay bé mang theo trò chơi mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w03_storytime', 'school_l9', 'storytime', 'giờ kể chuyện', '/ˈstɔː.ri.taɪm/', 'I bring my new storytime to school today.', 'Hôm nay bé mang theo giờ kể chuyện mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w04_lunchtime', 'school_l9', 'lunchtime', 'giờ ăn trưa', '/ˈlʌntʃ.taɪm/', 'I bring my new lunchtime to school today.', 'Hôm nay bé mang theo giờ ăn trưa mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w05_naptime', 'school_l9', 'naptime', 'giờ ngủ trưa', '/ˈnæp.taɪm/', 'I bring my new naptime to school today.', 'Hôm nay bé mang theo giờ ngủ trưa mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w06_project', 'school_l9', 'project', 'dự án nhóm', '/ˈprɒdʒ.ekt/', 'I bring my new project to school today.', 'Hôm nay bé mang theo dự án nhóm mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w07_presentation', 'school_l9', 'presentation', 'bài thuyết trình', '/ˌprez.ənˈteɪ.ʃən/', 'I bring my new presentation to school today.', 'Hôm nay bé mang theo bài thuyết trình mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w08_puzzle', 'school_l9', 'puzzle', 'trò ghép hình', '/ˈpʌz.əl/', 'I bring my new puzzle to school today.', 'Hôm nay bé mang theo trò ghép hình mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w09_song', 'school_l9', 'song', 'bài hát', '/sɒŋ/', 'I bring my new song to school today.', 'Hôm nay bé mang theo bài hát mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l09_w10_bell', 'school_l9', 'bell', 'tiếng chuông', '/bel/', 'I bring my new bell to school today.', 'Hôm nay bé mang theo tiếng chuông mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w01_polite', 'school_l10', 'polite', 'lễ phép', '/pəˈlaɪt/', 'I bring my new polite to school today.', 'Hôm nay bé mang theo lễ phép mới tinh đến trường học.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w02_share', 'school_l10', 'share', 'chia sẻ đồ chơi', '/ʃeər/', 'I bring my new share to school today.', 'Hôm nay bé mang theo chia sẻ đồ chơi mới tinh đến trường học.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w03_take_turns', 'school_l10', 'take turns', 'xếp hàng chờ lượt', '/teɪk tɜːnz/', 'I bring my new take turns to school today.', 'Hôm nay bé mang theo xếp hàng chờ lượt mới tinh đến trường học.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w04_please', 'school_l10', 'please', 'làm ơn / xin phép', '/pliːz/', 'I bring my new please to school today.', 'Hôm nay bé mang theo làm ơn / xin phép mới tinh đến trường học.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w05_thank_you', 'school_l10', 'thank you', 'cảm ơn', '/ˈθæŋk juː/', 'I bring my new thank you to school today.', 'Hôm nay bé mang theo cảm ơn mới tinh đến trường học.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w06_quiet', 'school_l10', 'quiet', 'giữ trật tự', '/ˈkwaɪ.ət/', 'I bring my new quiet to school today.', 'Hôm nay bé mang theo giữ trật tự mới tinh đến trường học.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w07_tidy', 'school_l10', 'tidy', 'gọn gàng', '/ˈtaɪ.di/', 'I bring my new tidy to school today.', 'Hôm nay bé mang theo gọn gàng mới tinh đến trường học.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w08_respect', 'school_l10', 'respect', 'tôn trọng', '/rɪˈspekt/', 'I bring my new respect to school today.', 'Hôm nay bé mang theo tôn trọng mới tinh đến trường học.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w09_careful', 'school_l10', 'careful', 'cẩn thận', '/ˈkeə.fəl/', 'I bring my new careful to school today.', 'Hôm nay bé mang theo cẩn thận mới tinh đến trường học.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('school_l10_w10_gentle', 'school_l10', 'gentle', 'nhã nhặn', '/ˈdʒen.təl/', 'I bring my new gentle to school today.', 'Hôm nay bé mang theo nhã nhặn mới tinh đến trường học.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w01_sun', 'nature_l1', 'sun', 'mặt trời', '/sʌn/', 'The beautiful sun makes our earth wonderful.', 'Cảnh sắc mặt trời tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w02_moon', 'nature_l1', 'moon', 'mặt trăng', '/muːn/', 'The beautiful moon makes our earth wonderful.', 'Cảnh sắc mặt trăng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w03_star', 'nature_l1', 'star', 'ngôi sao', '/stɑːr/', 'The beautiful star makes our earth wonderful.', 'Cảnh sắc ngôi sao tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w04_cloud', 'nature_l1', 'cloud', 'đám mây', '/klaʊd/', 'The beautiful cloud makes our earth wonderful.', 'Cảnh sắc đám mây tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w05_rain', 'nature_l1', 'rain', 'cơn mưa', '/reɪn/', 'The beautiful rain makes our earth wonderful.', 'Cảnh sắc cơn mưa tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w06_wind', 'nature_l1', 'wind', 'làn gió', '/wɪnd/', 'The beautiful wind makes our earth wonderful.', 'Cảnh sắc làn gió tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w07_rainbow', 'nature_l1', 'rainbow', 'cầu vồng', '/ˈreɪn.bəʊ/', 'The beautiful rainbow makes our earth wonderful.', 'Cảnh sắc cầu vồng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w08_snow', 'nature_l1', 'snow', 'tuyết trắng', '/snəʊ/', 'The beautiful snow makes our earth wonderful.', 'Cảnh sắc tuyết trắng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w09_sky', 'nature_l1', 'sky', 'bầu trời', '/skaɪ/', 'The beautiful sky makes our earth wonderful.', 'Cảnh sắc bầu trời tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l01_w10_sunshine', 'nature_l1', 'sunshine', 'ánh nắng ấm', '/ˈsʌn.ʃaɪn/', 'The beautiful sunshine makes our earth wonderful.', 'Cảnh sắc ánh nắng ấm tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w01_day', 'nature_l2', 'day', 'ban ngày', '/deɪ/', 'The beautiful day makes our earth wonderful.', 'Cảnh sắc ban ngày tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w02_night', 'nature_l2', 'night', 'ban đêm', '/naɪt/', 'The beautiful night makes our earth wonderful.', 'Cảnh sắc ban đêm tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w03_morning', 'nature_l2', 'morning', 'buổi sáng', '/ˈmɔː.nɪŋ/', 'The beautiful morning makes our earth wonderful.', 'Cảnh sắc buổi sáng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w04_evening', 'nature_l2', 'evening', 'buổi chiều tối', '/ˈiːv.nɪŋ/', 'The beautiful evening makes our earth wonderful.', 'Cảnh sắc buổi chiều tối tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w05_spring', 'nature_l2', 'spring', 'mùa xuân', '/sprɪŋ/', 'The beautiful spring makes our earth wonderful.', 'Cảnh sắc mùa xuân tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w06_summer', 'nature_l2', 'summer', 'mùa hè', '/ˈsʌm.ər/', 'The beautiful summer makes our earth wonderful.', 'Cảnh sắc mùa hè tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w07_autumn', 'nature_l2', 'autumn', 'mùa thu', '/ˈɔː.təm/', 'The beautiful autumn makes our earth wonderful.', 'Cảnh sắc mùa thu tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w08_winter', 'nature_l2', 'winter', 'mùa đông', '/ˈwɪn.tər/', 'The beautiful winter makes our earth wonderful.', 'Cảnh sắc mùa đông tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w09_dawn', 'nature_l2', 'dawn', 'bình minh', '/dɔːn/', 'The beautiful dawn makes our earth wonderful.', 'Cảnh sắc bình minh tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l02_w10_dusk', 'nature_l2', 'dusk', 'hoàng hôn', '/dʌsk/', 'The beautiful dusk makes our earth wonderful.', 'Cảnh sắc hoàng hôn tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w01_mountain', 'nature_l3', 'mountain', 'ngọn núi', '/ˈmaʊn.tɪn/', 'The beautiful mountain makes our earth wonderful.', 'Cảnh sắc ngọn núi tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w02_hill', 'nature_l3', 'hill', 'đồi thoai thoải', '/hɪl/', 'The beautiful hill makes our earth wonderful.', 'Cảnh sắc đồi thoai thoải tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w03_river', 'nature_l3', 'river', 'dòng sông', '/ˈrɪv.ər/', 'The beautiful river makes our earth wonderful.', 'Cảnh sắc dòng sông tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w04_lake', 'nature_l3', 'lake', 'hồ nước', '/leɪk/', 'The beautiful lake makes our earth wonderful.', 'Cảnh sắc hồ nước tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w05_sea', 'nature_l3', 'sea', 'biển cả', '/siː/', 'The beautiful sea makes our earth wonderful.', 'Cảnh sắc biển cả tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w06_ocean', 'nature_l3', 'ocean', 'đại dương', '/ˈəʊ.ʃən/', 'The beautiful ocean makes our earth wonderful.', 'Cảnh sắc đại dương tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w07_forest', 'nature_l3', 'forest', 'khu rừng', '/ˈfɒr.ɪst/', 'The beautiful forest makes our earth wonderful.', 'Cảnh sắc khu rừng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w08_island', 'nature_l3', 'island', 'hòn đảo', '/ˈaɪ.lənd/', 'The beautiful island makes our earth wonderful.', 'Cảnh sắc hòn đảo tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w09_beach', 'nature_l3', 'beach', 'bãi biển cát', '/biːtʃ/', 'The beautiful beach makes our earth wonderful.', 'Cảnh sắc bãi biển cát tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l03_w10_valley', 'nature_l3', 'valley', 'thung lũng', '/ˈvæl.i/', 'The beautiful valley makes our earth wonderful.', 'Cảnh sắc thung lũng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w01_tree', 'nature_l4', 'tree', 'cây xanh', '/triː/', 'The beautiful tree makes our earth wonderful.', 'Cảnh sắc cây xanh tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w02_flower', 'nature_l4', 'flower', 'bông hoa', '/ˈflaʊ.ər/', 'The beautiful flower makes our earth wonderful.', 'Cảnh sắc bông hoa tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w03_leaf', 'nature_l4', 'leaf', 'chiếc lá', '/liːf/', 'The beautiful leaf makes our earth wonderful.', 'Cảnh sắc chiếc lá tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w04_grass', 'nature_l4', 'grass', 'cỏ non', '/ɡrɑːs/', 'The beautiful grass makes our earth wonderful.', 'Cảnh sắc cỏ non tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w05_plant', 'nature_l4', 'plant', 'chậu cây', '/plɑːnt/', 'The beautiful plant makes our earth wonderful.', 'Cảnh sắc chậu cây tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w06_branch', 'nature_l4', 'branch', 'cành cây', '/brɑːntʃ/', 'The beautiful branch makes our earth wonderful.', 'Cảnh sắc cành cây tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w07_root', 'nature_l4', 'root', 'rễ cây', '/ruːt/', 'The beautiful root makes our earth wonderful.', 'Cảnh sắc rễ cây tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w08_seed', 'nature_l4', 'seed', 'hạt mầm', '/siːd/', 'The beautiful seed makes our earth wonderful.', 'Cảnh sắc hạt mầm tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w09_bush', 'nature_l4', 'bush', 'bụi cây', '/bʊʃ/', 'The beautiful bush makes our earth wonderful.', 'Cảnh sắc bụi cây tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l04_w10_bark', 'nature_l4', 'bark', 'vỏ cây', '/bɑːk/', 'The beautiful bark makes our earth wonderful.', 'Cảnh sắc vỏ cây tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w01_rose', 'nature_l5', 'rose', 'hoa hồng', '/rəʊz/', 'The beautiful rose makes our earth wonderful.', 'Cảnh sắc hoa hồng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w02_lotus', 'nature_l5', 'lotus', 'hoa sen', '/ˈləʊ.təs/', 'The beautiful lotus makes our earth wonderful.', 'Cảnh sắc hoa sen tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w03_sunflower', 'nature_l5', 'sunflower', 'hoa hướng dương', '/ˈsʌnˌflaʊ.ər/', 'The beautiful sunflower makes our earth wonderful.', 'Cảnh sắc hoa hướng dương tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w04_daisy', 'nature_l5', 'daisy', 'hoa cúc họa mi', '/ˈdeɪ.zi/', 'The beautiful daisy makes our earth wonderful.', 'Cảnh sắc hoa cúc họa mi tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w05_tulip', 'nature_l5', 'tulip', 'hoa uất kim hương', '/ˈtjuː.lɪp/', 'The beautiful tulip makes our earth wonderful.', 'Cảnh sắc hoa uất kim hương tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w06_orchid', 'nature_l5', 'orchid', 'hoa phong lan', '/ˈɔː.kɪd/', 'The beautiful orchid makes our earth wonderful.', 'Cảnh sắc hoa phong lan tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w07_lily', 'nature_l5', 'lily', 'hoa bách hợp', '/ˈlɪl.i/', 'The beautiful lily makes our earth wonderful.', 'Cảnh sắc hoa bách hợp tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w08_violet', 'nature_l5', 'violet', 'hoa hoa violet', '/ˈvaɪə.lət/', 'The beautiful violet makes our earth wonderful.', 'Cảnh sắc hoa hoa violet tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w09_jasmine', 'nature_l5', 'jasmine', 'hoa nhài thơm', '/ˈdʒæz.mɪn/', 'The beautiful jasmine makes our earth wonderful.', 'Cảnh sắc hoa nhài thơm tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l05_w10_blossom', 'nature_l5', 'blossom', 'hoa nở rộ', '/ˈblɒs.əm/', 'The beautiful blossom makes our earth wonderful.', 'Cảnh sắc hoa nở rộ tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w01_sunny', 'nature_l6', 'sunny', 'trời nắng đẹp', '/ˈsʌn.i/', 'The beautiful sunny makes our earth wonderful.', 'Cảnh sắc trời nắng đẹp tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w02_rainy', 'nature_l6', 'rainy', 'trời mưa rào', '/ˈreɪ.ni/', 'The beautiful rainy makes our earth wonderful.', 'Cảnh sắc trời mưa rào tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w03_windy', 'nature_l6', 'windy', 'trời lộng gió', '/ˈwɪn.di/', 'The beautiful windy makes our earth wonderful.', 'Cảnh sắc trời lộng gió tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w04_cloudy', 'nature_l6', 'cloudy', 'trời nhiều mây', '/ˈklaʊ.di/', 'The beautiful cloudy makes our earth wonderful.', 'Cảnh sắc trời nhiều mây tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w05_snowy', 'nature_l6', 'snowy', 'tuyết rơi', '/ˈsnəʊ.i/', 'The beautiful snowy makes our earth wonderful.', 'Cảnh sắc tuyết rơi tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w06_foggy', 'nature_l6', 'foggy', 'sương mù dày', '/ˈfɒɡ.i/', 'The beautiful foggy makes our earth wonderful.', 'Cảnh sắc sương mù dày tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w07_stormy', 'nature_l6', 'stormy', 'bão bùng', '/ˈstɔː.mi/', 'The beautiful stormy makes our earth wonderful.', 'Cảnh sắc bão bùng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w08_warm', 'nature_l6', 'warm', 'ấm áp dễ chịu', '/wɔːm/', 'The beautiful warm makes our earth wonderful.', 'Cảnh sắc ấm áp dễ chịu tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w09_chilly', 'nature_l6', 'chilly', 'se lạnh', '/ˈtʃɪl.i/', 'The beautiful chilly makes our earth wonderful.', 'Cảnh sắc se lạnh tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l06_w10_mild', 'nature_l6', 'mild', 'ôn hòa', '/maɪld/', 'The beautiful mild makes our earth wonderful.', 'Cảnh sắc ôn hòa tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w01_water', 'nature_l7', 'water', 'nguồn nước', '/ˈwɔː.tər/', 'The beautiful water makes our earth wonderful.', 'Cảnh sắc nguồn nước tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w02_fire', 'nature_l7', 'fire', 'ngọn lửa', '/faɪər/', 'The beautiful fire makes our earth wonderful.', 'Cảnh sắc ngọn lửa tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w03_earth', 'nature_l7', 'earth', 'mặt đất', '/ɜːθ/', 'The beautiful earth makes our earth wonderful.', 'Cảnh sắc mặt đất tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w04_air', 'nature_l7', 'air', 'không khí trong lành', '/eər/', 'The beautiful air makes our earth wonderful.', 'Cảnh sắc không khí trong lành tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w05_rock', 'nature_l7', 'rock', 'tảng đá lớn', '/rɒk/', 'The beautiful rock makes our earth wonderful.', 'Cảnh sắc tảng đá lớn tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w06_sand', 'nature_l7', 'sand', 'bãi cát mịn', '/sænd/', 'The beautiful sand makes our earth wonderful.', 'Cảnh sắc bãi cát mịn tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w07_soil', 'nature_l7', 'soil', 'đất màu mỡ', '/sɔɪl/', 'The beautiful soil makes our earth wonderful.', 'Cảnh sắc đất màu mỡ tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w08_stone', 'nature_l7', 'stone', 'viên sỏi tròn', '/stəʊn/', 'The beautiful stone makes our earth wonderful.', 'Cảnh sắc viên sỏi tròn tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w09_wave', 'nature_l7', 'wave', 'con sóng biển', '/weɪv/', 'The beautiful wave makes our earth wonderful.', 'Cảnh sắc con sóng biển tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l07_w10_mud', 'nature_l7', 'mud', 'bùn lầy', '/mʌd/', 'The beautiful mud makes our earth wonderful.', 'Cảnh sắc bùn lầy tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w01_thunder', 'nature_l8', 'thunder', 'tiếng sấm', '/ˈθʌn.dər/', 'The beautiful thunder makes our earth wonderful.', 'Cảnh sắc tiếng sấm tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w02_lightning', 'nature_l8', 'lightning', 'tia sét sáng', '/ˈlaɪt.nɪŋ/', 'The beautiful lightning makes our earth wonderful.', 'Cảnh sắc tia sét sáng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w03_storm', 'nature_l8', 'storm', 'cơn bão', '/stɔːm/', 'The beautiful storm makes our earth wonderful.', 'Cảnh sắc cơn bão tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w04_mist', 'nature_l8', 'mist', 'sương mờ', '/mɪst/', 'The beautiful mist makes our earth wonderful.', 'Cảnh sắc sương mờ tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w05_breeze', 'nature_l8', 'breeze', 'gió thoảng', '/briːz/', 'The beautiful breeze makes our earth wonderful.', 'Cảnh sắc gió thoảng tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w06_dew', 'nature_l8', 'dew', 'giọt sương mai', '/djuː/', 'The beautiful dew makes our earth wonderful.', 'Cảnh sắc giọt sương mai tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w07_frost', 'nature_l8', 'frost', 'băng giá', '/frɒst/', 'The beautiful frost makes our earth wonderful.', 'Cảnh sắc băng giá tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w08_comet', 'nature_l8', 'comet', 'sao chổi', '/ˈkɒm.ɪt/', 'The beautiful comet makes our earth wonderful.', 'Cảnh sắc sao chổi tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w09_sunset', 'nature_l8', 'sunset', 'cảnh hoàng hôn', '/ˈsʌn.set/', 'The beautiful sunset makes our earth wonderful.', 'Cảnh sắc cảnh hoàng hôn tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l08_w10_sunrise', 'nature_l8', 'sunrise', 'cảnh bình minh', '/ˈsʌn.raɪz/', 'The beautiful sunrise makes our earth wonderful.', 'Cảnh sắc cảnh bình minh tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w01_park', 'nature_l9', 'park', 'công viên', '/pɑːk/', 'The beautiful park makes our earth wonderful.', 'Cảnh sắc công viên tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w02_meadow', 'nature_l9', 'meadow', 'đồng cỏ hoa', '/ˈmed.əʊ/', 'The beautiful meadow makes our earth wonderful.', 'Cảnh sắc đồng cỏ hoa tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w03_cave', 'nature_l9', 'cave', 'hang động', '/keɪv/', 'The beautiful cave makes our earth wonderful.', 'Cảnh sắc hang động tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w04_waterfall', 'nature_l9', 'waterfall', 'thác nước', '/ˈwɔː.tə.fɔːl/', 'The beautiful waterfall makes our earth wonderful.', 'Cảnh sắc thác nước tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w05_desert', 'nature_l9', 'desert', 'sa mạc', '/ˈdez.ət/', 'The beautiful desert makes our earth wonderful.', 'Cảnh sắc sa mạc tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w06_jungle', 'nature_l9', 'jungle', 'rừng rậm', '/ˈdʒʌŋ.ɡəl/', 'The beautiful jungle makes our earth wonderful.', 'Cảnh sắc rừng rậm tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w07_stream', 'nature_l9', 'stream', 'con suối', '/striːm/', 'The beautiful stream makes our earth wonderful.', 'Cảnh sắc con suối tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w08_pond', 'nature_l9', 'pond', 'cái ao nhỏ', '/pɒnd/', 'The beautiful pond makes our earth wonderful.', 'Cảnh sắc cái ao nhỏ tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w09_field', 'nature_l9', 'field', 'cánh đồng lúa', '/fiːld/', 'The beautiful field makes our earth wonderful.', 'Cảnh sắc cánh đồng lúa tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l09_w10_cliff', 'nature_l9', 'cliff', 'vách đá cao', '/klɪf/', 'The beautiful cliff makes our earth wonderful.', 'Cảnh sắc vách đá cao tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w01_clean', 'nature_l10', 'clean', 'giữ sạch môi trường', '/kliːn/', 'The beautiful clean makes our earth wonderful.', 'Cảnh sắc giữ sạch môi trường tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w02_green', 'nature_l10', 'green', 'sống xanh', '/ɡriːn/', 'The beautiful green makes our earth wonderful.', 'Cảnh sắc sống xanh tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w03_save_water', 'nature_l10', 'save water', 'tiết kiệm nước', '/seɪv ˈwɔː.tər/', 'The beautiful save water makes our earth wonderful.', 'Cảnh sắc tiết kiệm nước tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w04_plant_tree', 'nature_l10', 'plant tree', 'trồng cây xanh', '/plɑːnt triː/', 'The beautiful plant tree makes our earth wonderful.', 'Cảnh sắc trồng cây xanh tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w05_fresh_air', 'nature_l10', 'fresh air', 'hít thở khí lành', '/freʃ eər/', 'The beautiful fresh air makes our earth wonderful.', 'Cảnh sắc hít thở khí lành tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w06_earth_love', 'nature_l10', 'earth love', 'yêu mến trái đất', '/ɜːθ lʌv/', 'The beautiful earth love makes our earth wonderful.', 'Cảnh sắc yêu mến trái đất tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w07_recycle', 'nature_l10', 'recycle', 'tái chế rác', '/ˌriːˈsaɪ.kəl/', 'The beautiful recycle makes our earth wonderful.', 'Cảnh sắc tái chế rác tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w08_care', 'nature_l10', 'care', 'chăm sóc thiên nhiên', '/keər/', 'The beautiful care makes our earth wonderful.', 'Cảnh sắc chăm sóc thiên nhiên tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w09_protect', 'nature_l10', 'protect', 'bảo vệ muông thú', '/prəˈtekt/', 'The beautiful protect makes our earth wonderful.', 'Cảnh sắc bảo vệ muông thú tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('nature_l10_w10_nature_joy', 'nature_l10', 'nature joy', 'vui cùng tự nhiên', '/ˈneɪ.tʃər dʒɔɪ/', 'The beautiful nature joy makes our earth wonderful.', 'Cảnh sắc vui cùng tự nhiên tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w01_car', 'vehicles_l1', 'car', 'ô tô con', '/kɑːr/', 'The fast car travels down the wide road.', 'Chiếc ô tô con bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w02_bus', 'vehicles_l1', 'bus', 'xe buýt', '/bʌs/', 'The fast bus travels down the wide road.', 'Chiếc xe buýt bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w03_bicycle', 'vehicles_l1', 'bicycle', 'xe đạp', '/ˈbaɪ.sɪ.kəl/', 'The fast bicycle travels down the wide road.', 'Chiếc xe đạp bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w04_motorbike', 'vehicles_l1', 'motorbike', 'xe máy', '/ˈməʊ.tə.baɪk/', 'The fast motorbike travels down the wide road.', 'Chiếc xe máy bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w05_truck', 'vehicles_l1', 'truck', 'xe tải', '/trʌk/', 'The fast truck travels down the wide road.', 'Chiếc xe tải bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w06_van', 'vehicles_l1', 'van', 'xe thùng chở đồ', '/væn/', 'The fast van travels down the wide road.', 'Chiếc xe thùng chở đồ bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w07_taxi', 'vehicles_l1', 'taxi', 'xe tắc xi', '/ˈtæk.si/', 'The fast taxi travels down the wide road.', 'Chiếc xe tắc xi bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w08_ambulance', 'vehicles_l1', 'ambulance', 'xe cứu thương', '/ˈæm.bjə.ləns/', 'The fast ambulance travels down the wide road.', 'Chiếc xe cứu thương bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w09_fire_truck', 'vehicles_l1', 'fire truck', 'xe cứu hỏa', '/ˈfaɪə trʌk/', 'The fast fire truck travels down the wide road.', 'Chiếc xe cứu hỏa bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l01_w10_police_car', 'vehicles_l1', 'police car', 'xe cảnh sát', '/pəˈliːs kɑːr/', 'The fast police car travels down the wide road.', 'Chiếc xe cảnh sát bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w01_train', 'vehicles_l2', 'train', 'tàu hỏa', '/treɪn/', 'The fast train travels down the wide road.', 'Chiếc tàu hỏa bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w02_subway', 'vehicles_l2', 'subway', 'tàu điện ngầm', '/ˈsʌb.weɪ/', 'The fast subway travels down the wide road.', 'Chiếc tàu điện ngầm bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w03_tram', 'vehicles_l2', 'tram', 'xe điện phố', '/træm/', 'The fast tram travels down the wide road.', 'Chiếc xe điện phố bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w04_tractor', 'vehicles_l2', 'tractor', 'máy kéo nông trại', '/ˈtræk.tər/', 'The fast tractor travels down the wide road.', 'Chiếc máy kéo nông trại bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w05_bulldozer', 'vehicles_l2', 'bulldozer', 'máy ủi đất', '/ˈbʊlˌdəʊ.zər/', 'The fast bulldozer travels down the wide road.', 'Chiếc máy ủi đất bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w06_crane', 'vehicles_l2', 'crane', 'cần cẩu xây dựng', '/kreɪn/', 'The fast crane travels down the wide road.', 'Chiếc cần cẩu xây dựng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w07_mixer', 'vehicles_l2', 'mixer', 'xe trộn bê tông', '/ˈmɪk.sər/', 'The fast mixer travels down the wide road.', 'Chiếc xe trộn bê tông bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w08_dump_truck', 'vehicles_l2', 'dump truck', 'xe ben chở cát', '/dʌmp trʌk/', 'The fast dump truck travels down the wide road.', 'Chiếc xe ben chở cát bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w09_roller', 'vehicles_l2', 'roller', 'xe lu san phẳng', '/ˈrəʊ.lər/', 'The fast roller travels down the wide road.', 'Chiếc xe lu san phẳng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l02_w10_trailer', 'vehicles_l2', 'trailer', 'xe kéo rơ-moóc', '/ˈtreɪ.lər/', 'The fast trailer travels down the wide road.', 'Chiếc xe kéo rơ-moóc bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w01_airplane', 'vehicles_l3', 'airplane', 'máy bay', '/ˈeə.pleɪn/', 'The fast airplane travels down the wide road.', 'Chiếc máy bay bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w02_helicopter', 'vehicles_l3', 'helicopter', 'máy bay trực thăng', '/ˈhel.ɪˌkɒp.tər/', 'The fast helicopter travels down the wide road.', 'Chiếc máy bay trực thăng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w03_rocket', 'vehicles_l3', 'rocket', 'tên lửa vũ trụ', '/ˈrɒk.ɪt/', 'The fast rocket travels down the wide road.', 'Chiếc tên lửa vũ trụ bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w04_balloon', 'vehicles_l3', 'balloon', 'khinh khí cầu', '/bəˈluːn/', 'The fast balloon travels down the wide road.', 'Chiếc khinh khí cầu bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w05_jet', 'vehicles_l3', 'jet', 'máy bay phản lực', '/dʒet/', 'The fast jet travels down the wide road.', 'Chiếc máy bay phản lực bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w06_glider', 'vehicles_l3', 'glider', 'tàu lượn', '/ˈɡlaɪ.dər/', 'The fast glider travels down the wide road.', 'Chiếc tàu lượn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w07_spaceship', 'vehicles_l3', 'spaceship', 'tàu không gian', '/ˈspeɪs.ʃɪp/', 'The fast spaceship travels down the wide road.', 'Chiếc tàu không gian bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w08_parachute', 'vehicles_l3', 'parachute', 'dù bay', '/ˈpær.ə.ʃuːt/', 'The fast parachute travels down the wide road.', 'Chiếc dù bay bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w09_drone', 'vehicles_l3', 'drone', 'thiết bị bay mini', '/drəʊn/', 'The fast drone travels down the wide road.', 'Chiếc thiết bị bay mini bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l03_w10_blimp', 'vehicles_l3', 'blimp', 'khí cầu thám hiểm', '/blɪmp/', 'The fast blimp travels down the wide road.', 'Chiếc khí cầu thám hiểm bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w01_boat', 'vehicles_l4', 'boat', 'thuyền nhỏ', '/bəʊt/', 'The fast boat travels down the wide road.', 'Chiếc thuyền nhỏ bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w02_ship', 'vehicles_l4', 'ship', 'con tàu lớn', '/ʃɪp/', 'The fast ship travels down the wide road.', 'Chiếc con tàu lớn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w03_submarine', 'vehicles_l4', 'submarine', 'tàu ngầm', '/ˈsʌb.mə.riːn/', 'The fast submarine travels down the wide road.', 'Chiếc tàu ngầm bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w04_sailboat', 'vehicles_l4', 'sailboat', 'thuyền buồm', '/ˈseɪl.bəʊt/', 'The fast sailboat travels down the wide road.', 'Chiếc thuyền buồm bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w05_canoe', 'vehicles_l4', 'canoe', 'thuyền ca-nô', '/kəˈnuː/', 'The fast canoe travels down the wide road.', 'Chiếc thuyền ca-nô bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w06_ferry', 'vehicles_l4', 'ferry', 'phà chở khách', '/ˈfer.i/', 'The fast ferry travels down the wide road.', 'Chiếc phà chở khách bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w07_yacht', 'vehicles_l4', 'yacht', 'du thuyền sang trọng', '/jɒt/', 'The fast yacht travels down the wide road.', 'Chiếc du thuyền sang trọng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w08_kayak', 'vehicles_l4', 'kayak', 'thuyền cai-ắc', '/ˈkaɪ.æk/', 'The fast kayak travels down the wide road.', 'Chiếc thuyền cai-ắc bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w09_raft', 'vehicles_l4', 'raft', 'bè tre', '/rɑːft/', 'The fast raft travels down the wide road.', 'Chiếc bè tre bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l04_w10_speedboat', 'vehicles_l4', 'speedboat', 'thuyền siêu tốc', '/ˈspiːd.bəʊt/', 'The fast speedboat travels down the wide road.', 'Chiếc thuyền siêu tốc bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w01_scooter', 'vehicles_l5', 'scooter', 'xe trượt scooter', '/ˈskuː.tər/', 'The fast scooter travels down the wide road.', 'Chiếc xe trượt scooter bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w02_skateboard', 'vehicles_l5', 'skateboard', 'ván trượt ba tanh', '/ˈskeɪt.bɔːd/', 'The fast skateboard travels down the wide road.', 'Chiếc ván trượt ba tanh bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w03_skates', 'vehicles_l5', 'skates', 'giày trượt pa-tin', '/skeɪts/', 'The fast skates travels down the wide road.', 'Chiếc giày trượt pa-tin bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w04_tricycle', 'vehicles_l5', 'tricycle', 'xe đạp ba bánh', '/ˈtraɪ.sɪ.kəl/', 'The fast tricycle travels down the wide road.', 'Chiếc xe đạp ba bánh bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w05_unicycle', 'vehicles_l5', 'unicycle', 'xe một bánh', '/ˈjuː.nɪˌsaɪ.kəl/', 'The fast unicycle travels down the wide road.', 'Chiếc xe một bánh bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w06_cart', 'vehicles_l5', 'cart', 'xe kéo tay', '/kɑːt/', 'The fast cart travels down the wide road.', 'Chiếc xe kéo tay bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w07_sledge', 'vehicles_l5', 'sledge', 'xe trượt tuyết', '/sledʒ/', 'The fast sledge travels down the wide road.', 'Chiếc xe trượt tuyết bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w08_wagon', 'vehicles_l5', 'wagon', 'xe chở đồ chơi', '/ˈwæɡ.ən/', 'The fast wagon travels down the wide road.', 'Chiếc xe chở đồ chơi bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w09_balance_bike', 'vehicles_l5', 'balance bike', 'xe thăng bằng', '/ˈbæl.əns baɪk/', 'The fast balance bike travels down the wide road.', 'Chiếc xe thăng bằng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l05_w10_roller', 'vehicles_l5', 'roller', 'giày trượt lăn', '/ˈrəʊ.lər/', 'The fast roller travels down the wide road.', 'Chiếc giày trượt lăn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w01_wheel', 'vehicles_l6', 'wheel', 'bánh xe tròn', '/wiːl/', 'The fast wheel travels down the wide road.', 'Chiếc bánh xe tròn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w02_tire', 'vehicles_l6', 'tire', 'lốp xe cao su', '/taɪər/', 'The fast tire travels down the wide road.', 'Chiếc lốp xe cao su bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w03_door', 'vehicles_l6', 'door', 'cửa xe', '/dɔːr/', 'The fast door travels down the wide road.', 'Chiếc cửa xe bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w04_window', 'vehicles_l6', 'window', 'cửa kính sổ', '/ˈwɪn.dəʊ/', 'The fast window travels down the wide road.', 'Chiếc cửa kính sổ bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w05_engine', 'vehicles_l6', 'engine', 'động cơ máy', '/ˈen.dʒɪn/', 'The fast engine travels down the wide road.', 'Chiếc động cơ máy bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w06_seat', 'vehicles_l6', 'seat', 'ghế ngồi', '/siːt/', 'The fast seat travels down the wide road.', 'Chiếc ghế ngồi bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w07_steering_wheel', 'vehicles_l6', 'steering wheel', 'vô-lăng lái', '/ˈstɪə.rɪŋ wiːl/', 'The fast steering wheel travels down the wide road.', 'Chiếc vô-lăng lái bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w08_headlight', 'vehicles_l6', 'headlight', 'đèn pha chiếu sáng', '/ˈhed.laɪt/', 'The fast headlight travels down the wide road.', 'Chiếc đèn pha chiếu sáng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w09_horn', 'vehicles_l6', 'horn', 'còi xe bíp bíp', '/hɔːn/', 'The fast horn travels down the wide road.', 'Chiếc còi xe bíp bíp bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l06_w10_brake', 'vehicles_l6', 'brake', 'phanh dừng xe', '/breɪk/', 'The fast brake travels down the wide road.', 'Chiếc phanh dừng xe bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w01_traffic_light', 'vehicles_l7', 'traffic light', 'đèn tín hiệu giao thông', '/ˈtræf.ɪk laɪt/', 'The fast traffic light travels down the wide road.', 'Chiếc đèn tín hiệu giao thông bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w02_road', 'vehicles_l7', 'road', 'con đường lớn', '/rəʊd/', 'The fast road travels down the wide road.', 'Chiếc con đường lớn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w03_street', 'vehicles_l7', 'street', 'phố phường', '/striːt/', 'The fast street travels down the wide road.', 'Chiếc phố phường bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w04_bridge', 'vehicles_l7', 'bridge', 'cây cầu bắc qua sông', '/brɪdʒ/', 'The fast bridge travels down the wide road.', 'Chiếc cây cầu bắc qua sông bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w05_tunnel', 'vehicles_l7', 'tunnel', 'đường hầm xuyên núi', '/ˈtʌn.əl/', 'The fast tunnel travels down the wide road.', 'Chiếc đường hầm xuyên núi bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w06_stop_sign', 'vehicles_l7', 'stop sign', 'biển báo dừng lại', '/stɒp saɪn/', 'The fast stop sign travels down the wide road.', 'Chiếc biển báo dừng lại bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w07_crosswalk', 'vehicles_l7', 'crosswalk', 'vạch kẻ cho người đi bộ', '/ˈkrɒs.wɔːk/', 'The fast crosswalk travels down the wide road.', 'Chiếc vạch kẻ cho người đi bộ bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w08_sidewalk', 'vehicles_l7', 'sidewalk', 'vỉa hè an toàn', '/ˈsaɪd.wɔːk/', 'The fast sidewalk travels down the wide road.', 'Chiếc vỉa hè an toàn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w09_highway', 'vehicles_l7', 'highway', 'đường cao tốc', '/ˈhaɪ.weɪ/', 'The fast highway travels down the wide road.', 'Chiếc đường cao tốc bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l07_w10_track', 'vehicles_l7', 'track', 'đường ray tàu hỏa', '/træk/', 'The fast track travels down the wide road.', 'Chiếc đường ray tàu hỏa bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w01_ride', 'vehicles_l8', 'ride', 'cưỡi / đi xe đạp', '/raɪd/', 'The fast ride travels down the wide road.', 'Chiếc cưỡi / đi xe đạp bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w02_drive', 'vehicles_l8', 'drive', 'lái xe ô tô', '/draɪv/', 'The fast drive travels down the wide road.', 'Chiếc lái xe ô tô bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w03_fly', 'vehicles_l8', 'fly', 'bay lượn trên cao', '/flaɪ/', 'The fast fly travels down the wide road.', 'Chiếc bay lượn trên cao bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w04_sail', 'vehicles_l8', 'sail', 'giương buồm ra khơi', '/seɪl/', 'The fast sail travels down the wide road.', 'Chiếc giương buồm ra khơi bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w05_go', 'vehicles_l8', 'go', 'tiến bước', '/ɡəʊ/', 'The fast go travels down the wide road.', 'Chiếc tiến bước bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w06_stop', 'vehicles_l8', 'stop', 'dừng lại an toàn', '/stɒp/', 'The fast stop travels down the wide road.', 'Chiếc dừng lại an toàn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w07_turn', 'vehicles_l8', 'turn', 'rẽ hướng', '/tɜːn/', 'The fast turn travels down the wide road.', 'Chiếc rẽ hướng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w08_fast', 'vehicles_l8', 'fast', 'chạy nhanh', '/fɑːst/', 'The fast fast travels down the wide road.', 'Chiếc chạy nhanh bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w09_slow', 'vehicles_l8', 'slow', 'đi chậm cẩn thận', '/sləʊ/', 'The fast slow travels down the wide road.', 'Chiếc đi chậm cẩn thận bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l08_w10_travel', 'vehicles_l8', 'travel', 'du lịch khám phá', '/ˈtræv.əl/', 'The fast travel travels down the wide road.', 'Chiếc du lịch khám phá bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w01_bus_stop', 'vehicles_l9', 'bus stop', 'trạm dừng xe buýt', '/bʌs stɒp/', 'The fast bus stop travels down the wide road.', 'Chiếc trạm dừng xe buýt bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w02_train_station', 'vehicles_l9', 'train station', 'nhà ga xe lửa', '/treɪn ˈsteɪ.ʃən/', 'The fast train station travels down the wide road.', 'Chiếc nhà ga xe lửa bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w03_airport', 'vehicles_l9', 'airport', 'sân bay nhộn nhịp', '/ˈeə.pɔːt/', 'The fast airport travels down the wide road.', 'Chiếc sân bay nhộn nhịp bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w04_harbor', 'vehicles_l9', 'harbor', 'bến cảng neo đậu', '/ˈhɑː.bər/', 'The fast harbor travels down the wide road.', 'Chiếc bến cảng neo đậu bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w05_gas_station', 'vehicles_l9', 'gas station', 'cây xăng', '/ɡæs ˈsteɪ.ʃən/', 'The fast gas station travels down the wide road.', 'Chiếc cây xăng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w06_parking_lot', 'vehicles_l9', 'parking lot', 'bãi đỗ xe', '/ˈpɑː.kɪŋ lɒt/', 'The fast parking lot travels down the wide road.', 'Chiếc bãi đỗ xe bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w07_ticket', 'vehicles_l9', 'ticket', 'vé đi tàu xe', '/ˈtɪk.ɪt/', 'The fast ticket travels down the wide road.', 'Chiếc vé đi tàu xe bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w08_passenger', 'vehicles_l9', 'passenger', 'hành khách', '/ˈpæs.ən.dʒər/', 'The fast passenger travels down the wide road.', 'Chiếc hành khách bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w09_driver', 'vehicles_l9', 'driver', 'bác tài xế', '/ˈdraɪ.vər/', 'The fast driver travels down the wide road.', 'Chiếc bác tài xế bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l09_w10_pilot', 'vehicles_l9', 'pilot', 'chú phi công', '/ˈpaɪ.lət/', 'The fast pilot travels down the wide road.', 'Chiếc chú phi công bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w01_seatbelt', 'vehicles_l10', 'seatbelt', 'dây an toàn', '/ˈsiːt.belt/', 'The fast seatbelt travels down the wide road.', 'Chiếc dây an toàn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w02_helmet', 'vehicles_l10', 'helmet', 'mũ bảo hiểm', '/ˈhel.mɪt/', 'The fast helmet travels down the wide road.', 'Chiếc mũ bảo hiểm bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w03_buckle_up', 'vehicles_l10', 'buckle up', 'thắt chặt dây an toàn', '/ˈbʌk.əl ʌp/', 'The fast buckle up travels down the wide road.', 'Chiếc thắt chặt dây an toàn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w04_hold_hands', 'vehicles_l10', 'hold hands', 'nắm chặt tay người lớn', '/həʊld hændz/', 'The fast hold hands travels down the wide road.', 'Chiếc nắm chặt tay người lớn bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w05_look_left', 'vehicles_l10', 'look left', 'nhìn sang bên trái', '/lʊk left/', 'The fast look left travels down the wide road.', 'Chiếc nhìn sang bên trái bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w06_look_right', 'vehicles_l10', 'look right', 'nhìn sang bên phải', '/lʊk raɪt/', 'The fast look right travels down the wide road.', 'Chiếc nhìn sang bên phải bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w07_walk_safe', 'vehicles_l10', 'walk safe', 'bước đi cẩn trọng', '/wɔːk seɪf/', 'The fast walk safe travels down the wide road.', 'Chiếc bước đi cẩn trọng bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w08_caution', 'vehicles_l10', 'caution', 'chú ý quan sát', '/ˈkɔː.ʃən/', 'The fast caution travels down the wide road.', 'Chiếc chú ý quan sát bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w09_signal', 'vehicles_l10', 'signal', 'xi-nhan báo hiệu', '/ˈsɪɡ.nəl/', 'The fast signal travels down the wide road.', 'Chiếc xi-nhan báo hiệu bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('vehicles_l10_w10_safe_road', 'vehicles_l10', 'safe road', 'an toàn trên mọi nẻo đường', '/seɪf rəʊd/', 'The fast safe road travels down the wide road.', 'Chiếc an toàn trên mọi nẻo đường bon bon chạy lướt nhanh trên con đường rộng lớn.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w01_shirt', 'clothing_l1', 'shirt', 'áo sơ mi', '/ʃɜːt/', 'I wear this neat shirt when I go out.', 'Bé mặc chiếc áo sơ mi gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w02_t_shirt', 'clothing_l1', 'T-shirt', 'áo thun ngắn tay', '/ˈtiː.ʃɜːt/', 'I wear this neat t-shirt when I go out.', 'Bé mặc chiếc áo thun ngắn tay gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w03_pants', 'clothing_l1', 'pants', 'quần dài', '/pænts/', 'These comfortable pants fit me perfectly.', 'Chiếc quần dài vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w04_shorts', 'clothing_l1', 'shorts', 'quần đùi / soóc', '/ʃɔːts/', 'These comfortable shorts fit me perfectly.', 'Chiếc quần đùi / soóc vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w05_dress', 'clothing_l1', 'dress', 'chiếc váy liền xinh', '/dres/', 'I wear this neat dress when I go out.', 'Bé mặc chiếc chiếc váy liền xinh gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w06_skirt', 'clothing_l1', 'skirt', 'chân váy xoay tròn', '/skɜːt/', 'I wear this neat skirt when I go out.', 'Bé mặc chiếc chân váy xoay tròn gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w07_jacket', 'clothing_l1', 'jacket', 'áo khoác nhẹ', '/ˈdʒæk.ɪt/', 'I wear this neat jacket when I go out.', 'Bé mặc chiếc áo khoác nhẹ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w08_coat', 'clothing_l1', 'coat', 'áo choàng ấm', '/kəʊt/', 'I wear this neat coat when I go out.', 'Bé mặc chiếc áo choàng ấm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w09_sweater', 'clothing_l1', 'sweater', 'áo len dày', '/ˈswet.ər/', 'I wear this neat sweater when I go out.', 'Bé mặc chiếc áo len dày gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l01_w10_jeans', 'clothing_l1', 'jeans', 'quần bò', '/dʒiːnz/', 'These comfortable jeans fit me perfectly.', 'Chiếc quần bò vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w01_shoes', 'clothing_l2', 'shoes', 'đôi giày', '/ʃuːz/', 'These comfortable shoes fit me perfectly.', 'Chiếc đôi giày vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w02_socks', 'clothing_l2', 'socks', 'đôi tất ấm', '/sɒks/', 'These comfortable socks fit me perfectly.', 'Chiếc đôi tất ấm vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w03_sandals', 'clothing_l2', 'sandals', 'dép quai hậu', '/ˈsæn.dəl/', 'I wear this neat sandals when I go out.', 'Bé mặc chiếc dép quai hậu gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w04_boots', 'clothing_l2', 'boots', 'đôi ủng cao cổ', '/buːts/', 'These comfortable boots fit me perfectly.', 'Chiếc đôi ủng cao cổ vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w05_sneakers', 'clothing_l2', 'sneakers', 'giày thể thao', '/ˈsniː.kəz/', 'I wear this neat sneakers when I go out.', 'Bé mặc chiếc giày thể thao gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w06_slippers', 'clothing_l2', 'slippers', 'dép đi trong nhà', '/ˈslɪp.əz/', 'I wear this neat slippers when I go out.', 'Bé mặc chiếc dép đi trong nhà gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w07_pajamas', 'clothing_l2', 'pajamas', 'bộ đồ ngủ', '/pəˈdʒɑː.məz/', 'I wear this neat pajamas when I go out.', 'Bé mặc chiếc bộ đồ ngủ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w08_vest', 'clothing_l2', 'vest', 'áo gile', '/vest/', 'I wear this neat vest when I go out.', 'Bé mặc chiếc áo gile gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w09_robe', 'clothing_l2', 'robe', 'áo choàng tắm', '/rəʊb/', 'I wear this neat robe when I go out.', 'Bé mặc chiếc áo choàng tắm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l02_w10_clogs', 'clothing_l2', 'clogs', 'guốc mộc xinh', '/klɒɡz/', 'I wear this neat clogs when I go out.', 'Bé mặc chiếc guốc mộc xinh gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w01_hat', 'clothing_l3', 'hat', 'mũ vành rộng', '/hæt/', 'I wear this neat hat when I go out.', 'Bé mặc chiếc mũ vành rộng gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w02_cap', 'clothing_l3', 'cap', 'mũ lưỡi trai', '/kæp/', 'I wear this neat cap when I go out.', 'Bé mặc chiếc mũ lưỡi trai gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w03_belt', 'clothing_l3', 'belt', 'thắt lưng', '/belt/', 'I wear this neat belt when I go out.', 'Bé mặc chiếc thắt lưng gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w04_scarf', 'clothing_l3', 'scarf', 'khăn quàng cổ', '/skɑːf/', 'I wear this neat scarf when I go out.', 'Bé mặc chiếc khăn quàng cổ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w05_gloves', 'clothing_l3', 'gloves', 'đôi găng tay', '/ɡlʌvz/', 'I wear this neat gloves when I go out.', 'Bé mặc chiếc đôi găng tay gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w06_mittens', 'clothing_l3', 'mittens', 'bao tay liền ngón', '/ˈmɪt.ənz/', 'I wear this neat mittens when I go out.', 'Bé mặc chiếc bao tay liền ngón gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w07_sunglasses', 'clothing_l3', 'sunglasses', 'kính râm mát', '/ˈsʌnˌɡlɑː.sɪz/', 'These comfortable sunglasses fit me perfectly.', 'Chiếc kính râm mát vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w08_watch', 'clothing_l3', 'watch', 'đồng hồ đeo tay', '/wɒtʃ/', 'I wear this neat watch when I go out.', 'Bé mặc chiếc đồng hồ đeo tay gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w09_bag', 'clothing_l3', 'bag', 'túi xách', '/bæɡ/', 'I wear this neat bag when I go out.', 'Bé mặc chiếc túi xách gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l03_w10_backpack', 'clothing_l3', 'backpack', 'ba lô đi học', '/ˈbæk.pæk/', 'I wear this neat backpack when I go out.', 'Bé mặc chiếc ba lô đi học gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w01_raincoat', 'clothing_l4', 'raincoat', 'áo mưa', '/ˈreɪn.kəʊt/', 'I wear this neat raincoat when I go out.', 'Bé mặc chiếc áo mưa gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w02_umbrella', 'clothing_l4', 'umbrella', 'chiếc ô che', '/ʌmˈbrel.ə/', 'I wear this neat umbrella when I go out.', 'Bé mặc chiếc chiếc ô che gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w03_earmuffs', 'clothing_l4', 'earmuffs', 'bịt tai giữ ấm', '/ˈɪə.mʌfs/', 'I wear this neat earmuffs when I go out.', 'Bé mặc chiếc bịt tai giữ ấm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w04_winter_coat', 'clothing_l4', 'winter coat', 'áo khoác đại hàn', '/ˈwɪn.tər kəʊt/', 'I wear this neat winter coat when I go out.', 'Bé mặc chiếc áo khoác đại hàn gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w05_beanie', 'clothing_l4', 'beanie', 'mũ len trùm đầu', '/ˈbiː.ni/', 'I wear this neat beanie when I go out.', 'Bé mặc chiếc mũ len trùm đầu gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w06_hood', 'clothing_l4', 'hood', 'mũ trùm áo khoác', '/hʊd/', 'I wear this neat hood when I go out.', 'Bé mặc chiếc mũ trùm áo khoác gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w07_wool_sweater', 'clothing_l4', 'wool sweater', 'áo len cừu', '/wʊl ˈswet.ər/', 'I wear this neat wool sweater when I go out.', 'Bé mặc chiếc áo len cừu gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w08_poncho', 'clothing_l4', 'poncho', 'áo choàng poncho', '/ˈpɒn.tʃəʊ/', 'I wear this neat poncho when I go out.', 'Bé mặc chiếc áo choàng poncho gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w09_thermals', 'clothing_l4', 'thermals', 'quần áo giữ nhiệt', '/ˈθɜː.məlz/', 'I wear this neat thermals when I go out.', 'Bé mặc chiếc quần áo giữ nhiệt gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l04_w10_windbreaker', 'clothing_l4', 'windbreaker', 'áo gió cản lạnh', '/ˈwɪndˌbreɪ.kər/', 'I wear this neat windbreaker when I go out.', 'Bé mặc chiếc áo gió cản lạnh gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w01_swimsuit', 'clothing_l5', 'swimsuit', 'bộ đồ bơi', '/ˈswɪm.suːt/', 'I wear this neat swimsuit when I go out.', 'Bé mặc chiếc bộ đồ bơi gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w02_sunhat', 'clothing_l5', 'sunhat', 'mũ đi nắng', '/ˈsʌn.hæt/', 'I wear this neat sunhat when I go out.', 'Bé mặc chiếc mũ đi nắng gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w03_flip_flops', 'clothing_l5', 'flip-flops', 'dép tông xỏ ngón', '/ˈflɪp.flɒps/', 'I wear this neat flip-flops when I go out.', 'Bé mặc chiếc dép tông xỏ ngón gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w04_tank_top', 'clothing_l5', 'tank top', 'áo ba lỗ', '/ˈtæŋk ˌtɒp/', 'I wear this neat tank top when I go out.', 'Bé mặc chiếc áo ba lỗ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w05_towel', 'clothing_l5', 'towel', 'khăn tắm biển', '/taʊəl/', 'I wear this neat towel when I go out.', 'Bé mặc chiếc khăn tắm biển gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w06_goggles', 'clothing_l5', 'goggles', 'kính bơi lặn', '/ˈɡɒɡ.əlz/', 'I wear this neat goggles when I go out.', 'Bé mặc chiếc kính bơi lặn gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w07_visor', 'clothing_l5', 'visor', 'mũ nửa đầu che nắng', '/ˈvaɪ.zər/', 'I wear this neat visor when I go out.', 'Bé mặc chiếc mũ nửa đầu che nắng gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w08_sun_dress', 'clothing_l5', 'sun dress', 'váy mùa hè', '/ˈsʌn dres/', 'I wear this neat sun dress when I go out.', 'Bé mặc chiếc váy mùa hè gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w09_board_shorts', 'clothing_l5', 'board shorts', 'quần bơi nam', '/ˈbɔːd ʃɔːts/', 'These comfortable board shorts fit me perfectly.', 'Chiếc quần bơi nam vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l05_w10_rash_guard', 'clothing_l5', 'rash guard', 'áo bơi chống nắng', '/ˈræʃ ɡɑːd/', 'I wear this neat rash guard when I go out.', 'Bé mặc chiếc áo bơi chống nắng gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w01_uniform', 'clothing_l6', 'uniform', 'bộ đồng phục', '/ˈjuː.nɪ.fɔːm/', 'I wear this neat uniform when I go out.', 'Bé mặc chiếc bộ đồng phục gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w02_collar', 'clothing_l6', 'collar', 'cổ áo đứng', '/ˈkɒl.ər/', 'I wear this neat collar when I go out.', 'Bé mặc chiếc cổ áo đứng gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w03_tie', 'clothing_l6', 'tie', 'cà vạt chỉnh tề', '/taɪ/', 'I wear this neat tie when I go out.', 'Bé mặc chiếc cà vạt chỉnh tề gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w04_button', 'clothing_l6', 'button', 'chiếc cúc áo', '/ˈbʌt.ən/', 'I wear this neat button when I go out.', 'Bé mặc chiếc chiếc cúc áo gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w05_pocket', 'clothing_l6', 'pocket', 'túi áo nhỏ', '/ˈpɒk.ɪt/', 'I wear this neat pocket when I go out.', 'Bé mặc chiếc túi áo nhỏ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w06_zipper', 'clothing_l6', 'zipper', 'khóa kéo', '/ˈzɪp.ər/', 'I wear this neat zipper when I go out.', 'Bé mặc chiếc khóa kéo gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w07_apron', 'clothing_l6', 'apron', 'tạp dề làm bếp', '/ˈeɪ.prən/', 'I wear this neat apron when I go out.', 'Bé mặc chiếc tạp dề làm bếp gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w08_bow', 'clothing_l6', 'bow', 'chiếc nơ xinh', '/bəʊ/', 'I wear this neat bow when I go out.', 'Bé mặc chiếc chiếc nơ xinh gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w09_blazer', 'clothing_l6', 'blazer', 'áo vest học sinh', '/ˈbleɪ.zər/', 'I wear this neat blazer when I go out.', 'Bé mặc chiếc áo vest học sinh gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l06_w10_badge', 'clothing_l6', 'badge', 'huy hiệu trường', '/bædʒ/', 'I wear this neat badge when I go out.', 'Bé mặc chiếc huy hiệu trường gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w01_put_on', 'clothing_l7', 'put on', 'mặc đồ vào', '/pʊt ɒn/', 'I wear this neat put on when I go out.', 'Bé mặc chiếc mặc đồ vào gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w02_take_off', 'clothing_l7', 'take off', 'cởi đồ ra', '/teɪk ɒf/', 'I wear this neat take off when I go out.', 'Bé mặc chiếc cởi đồ ra gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w03_wear', 'clothing_l7', 'wear', 'khoác lên người', '/weər/', 'I wear this neat wear when I go out.', 'Bé mặc chiếc khoác lên người gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w04_button_up', 'clothing_l7', 'button up', 'cài khuy áo', '/ˈbʌt.ən ʌp/', 'I wear this neat button up when I go out.', 'Bé mặc chiếc cài khuy áo gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w05_zip_up', 'clothing_l7', 'zip up', 'kéo khóa áo', '/zɪp ʌp/', 'I wear this neat zip up when I go out.', 'Bé mặc chiếc kéo khóa áo gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w06_tie_lace', 'clothing_l7', 'tie lace', 'buộc dây giày', '/taɪ leɪs/', 'I wear this neat tie lace when I go out.', 'Bé mặc chiếc buộc dây giày gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w07_wash', 'clothing_l7', 'wash', 'giặt giũ sạch sẽ', '/wɒʃ/', 'I wear this neat wash when I go out.', 'Bé mặc chiếc giặt giũ sạch sẽ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w08_fold', 'clothing_l7', 'fold', 'gấp quần áo gọn gàng', '/fəʊld/', 'I wear this neat fold when I go out.', 'Bé mặc chiếc gấp quần áo gọn gàng gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w09_change', 'clothing_l7', 'change', 'thay trang phục mới', '/tʃeɪndʒ/', 'I wear this neat change when I go out.', 'Bé mặc chiếc thay trang phục mới gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l07_w10_iron', 'clothing_l7', 'iron', 'là ủi thẳng thớm', '/aɪən/', 'I wear this neat iron when I go out.', 'Bé mặc chiếc là ủi thẳng thớm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w01_cotton', 'clothing_l8', 'cotton', 'vải sợi bông', '/ˈkɒt.ən/', 'I wear this neat cotton when I go out.', 'Bé mặc chiếc vải sợi bông gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w02_wool', 'clothing_l8', 'wool', 'sợi len mềm', '/wʊl/', 'I wear this neat wool when I go out.', 'Bé mặc chiếc sợi len mềm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w03_silk', 'clothing_l8', 'silk', 'lụa tơ tằm', '/sɪlk/', 'I wear this neat silk when I go out.', 'Bé mặc chiếc lụa tơ tằm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w04_denim', 'clothing_l8', 'denim', 'vải bò cá tính', '/ˈden.ɪm/', 'I wear this neat denim when I go out.', 'Bé mặc chiếc vải bò cá tính gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w05_leather', 'clothing_l8', 'leather', 'chất liệu da', '/ˈleð.ər/', 'I wear this neat leather when I go out.', 'Bé mặc chiếc chất liệu da gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w06_stripes', 'clothing_l8', 'stripes', 'họa tiết kẻ sọc', '/straɪps/', 'I wear this neat stripes when I go out.', 'Bé mặc chiếc họa tiết kẻ sọc gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w07_polka_dots', 'clothing_l8', 'polka dots', 'chấm bi xinh xắn', '/ˈpɒl.kə dɒts/', 'I wear this neat polka dots when I go out.', 'Bé mặc chiếc chấm bi xinh xắn gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w08_plaid', 'clothing_l8', 'plaid', 'kẻ ca-rô', '/plæd/', 'I wear this neat plaid when I go out.', 'Bé mặc chiếc kẻ ca-rô gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w09_soft', 'clothing_l8', 'soft', 'chất vải êm ái', '/sɒft/', 'I wear this neat soft when I go out.', 'Bé mặc chiếc chất vải êm ái gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l08_w10_warm', 'clothing_l8', 'warm', 'giữ ấm tuyệt vời', '/wɔːm/', 'I wear this neat warm when I go out.', 'Bé mặc chiếc giữ ấm tuyệt vời gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w01_tight', 'clothing_l9', 'tight', 'vừa vặn ôm người', '/taɪt/', 'I wear this neat tight when I go out.', 'Bé mặc chiếc vừa vặn ôm người gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w02_loose', 'clothing_l9', 'loose', 'rộng rãi thoải mái', '/luːs/', 'I wear this neat loose when I go out.', 'Bé mặc chiếc rộng rãi thoải mái gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w03_big', 'clothing_l9', 'big', 'kích cỡ lớn', '/bɪɡ/', 'I wear this neat big when I go out.', 'Bé mặc chiếc kích cỡ lớn gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w04_small', 'clothing_l9', 'small', 'kích cỡ nhỏ', '/smɔːl/', 'I wear this neat small when I go out.', 'Bé mặc chiếc kích cỡ nhỏ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w05_long', 'clothing_l9', 'long', 'ống dài', '/lɒŋ/', 'I wear this neat long when I go out.', 'Bé mặc chiếc ống dài gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w06_short', 'clothing_l9', 'short', 'dáng ngắn', '/ʃɔːt/', 'I wear this neat short when I go out.', 'Bé mặc chiếc dáng ngắn gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w07_clean', 'clothing_l9', 'clean', 'sạch tinh tươm', '/kliːn/', 'I wear this neat clean when I go out.', 'Bé mặc chiếc sạch tinh tươm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w08_neat', 'clothing_l9', 'neat', 'gọn gàng tinh tươm', '/niːt/', 'I wear this neat neat when I go out.', 'Bé mặc chiếc gọn gàng tinh tươm gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w09_pretty', 'clothing_l9', 'pretty', 'xinh xắn dễ thương', '/ˈprɪt.i/', 'I wear this neat pretty when I go out.', 'Bé mặc chiếc xinh xắn dễ thương gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l09_w10_cozy', 'clothing_l9', 'cozy', 'ấm cúng dễ chịu', '/ˈkəʊ.zi/', 'I wear this neat cozy when I go out.', 'Bé mặc chiếc ấm cúng dễ chịu gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w01_ring', 'clothing_l10', 'ring', 'chiếc nhẫn đeo tay', '/rɪŋ/', 'I wear this neat ring when I go out.', 'Bé mặc chiếc chiếc nhẫn đeo tay gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w02_necklace', 'clothing_l10', 'necklace', 'dây chuyền đeo cổ', '/ˈnek.ləs/', 'I wear this neat necklace when I go out.', 'Bé mặc chiếc dây chuyền đeo cổ gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w03_bracelet', 'clothing_l10', 'bracelet', 'vòng lắc tay', '/ˈbreɪ.slət/', 'I wear this neat bracelet when I go out.', 'Bé mặc chiếc vòng lắc tay gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w04_crown', 'clothing_l10', 'crown', 'vương miện lấp lánh', '/kraʊn/', 'I wear this neat crown when I go out.', 'Bé mặc chiếc vương miện lấp lánh gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w05_costume', 'clothing_l10', 'costume', 'bộ đồ hóa trang', '/ˈkɒs.tʃuːm/', 'I wear this neat costume when I go out.', 'Bé mặc chiếc bộ đồ hóa trang gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w06_mask', 'clothing_l10', 'mask', 'mặt nạ hóa trang', '/mɑːsk/', 'I wear this neat mask when I go out.', 'Bé mặc chiếc mặt nạ hóa trang gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w07_ribbon', 'clothing_l10', 'ribbon', 'dải ruy-băng buộc tóc', '/ˈrɪb.ən/', 'I wear this neat ribbon when I go out.', 'Bé mặc chiếc dải ruy-băng buộc tóc gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w08_hairband', 'clothing_l10', 'hairband', 'băng đô cài tóc', '/ˈheə.bænd/', 'I wear this neat hairband when I go out.', 'Bé mặc chiếc băng đô cài tóc gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w09_pin', 'clothing_l10', 'pin', 'trâm cài áo', '/pɪn/', 'I wear this neat pin when I go out.', 'Bé mặc chiếc trâm cài áo gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('clothing_l10_w10_cape', 'clothing_l10', 'cape', 'áo choàng siêu nhân', '/keɪp/', 'I wear this neat cape when I go out.', 'Bé mặc chiếc áo choàng siêu nhân gọn gàng, xinh xắn này khi đi ra ngoài.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w01_happy', 'feelings_l1', 'happy', 'vui sướng', '/ˈhæp.i/', 'I feel happy when I learn English with Dino.', 'Bé cảm thấy vui sướng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w02_sad', 'feelings_l1', 'sad', 'buồn bã', '/sæd/', 'I feel sad when I learn English with Dino.', 'Bé cảm thấy buồn bã khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w03_angry', 'feelings_l1', 'angry', 'tức giận', '/ˈæŋ.ɡri/', 'I feel angry when I learn English with Dino.', 'Bé cảm thấy tức giận khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w04_scared', 'feelings_l1', 'scared', 'sợ sệt', '/skeəd/', 'I feel scared when I learn English with Dino.', 'Bé cảm thấy sợ sệt khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w05_surprised', 'feelings_l1', 'surprised', 'ngạc nhiên', '/səˈpraɪzd/', 'I feel surprised when I learn English with Dino.', 'Bé cảm thấy ngạc nhiên khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w06_tired', 'feelings_l1', 'tired', 'mỏi mệt', '/taɪəd/', 'I feel tired when I learn English with Dino.', 'Bé cảm thấy mỏi mệt khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w07_calm', 'feelings_l1', 'calm', 'bình tĩnh', '/kɑːm/', 'I feel calm when I learn English with Dino.', 'Bé cảm thấy bình tĩnh khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w08_excited', 'feelings_l1', 'excited', 'phấn khích', '/ɪkˈsaɪ.tɪd/', 'I feel excited when I learn English with Dino.', 'Bé cảm thấy phấn khích khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w09_silly', 'feelings_l1', 'silly', 'tinh nghịch nhắng nhít', '/ˈsɪl.i/', 'I feel silly when I learn English with Dino.', 'Bé cảm thấy tinh nghịch nhắng nhít khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l01_w10_shy', 'feelings_l1', 'shy', 'bẽn lẽn ngượng ngùng', '/ʃaɪ/', 'I feel shy when I learn English with Dino.', 'Bé cảm thấy bẽn lẽn ngượng ngùng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w01_cheerful', 'feelings_l2', 'cheerful', 'tươi vui rạng rỡ', '/ˈtʃɪə.fəl/', 'I feel cheerful when I learn English with Dino.', 'Bé cảm thấy tươi vui rạng rỡ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w02_joyful', 'feelings_l2', 'joyful', 'tràn ngập niềm vui', '/ˈdʒɔɪ.fəl/', 'I feel joyful when I learn English with Dino.', 'Bé cảm thấy tràn ngập niềm vui khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w03_glad', 'feelings_l2', 'glad', 'hân hoan phấn khởi', '/ɡlæd/', 'I feel glad when I learn English with Dino.', 'Bé cảm thấy hân hoan phấn khởi khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w04_delighted', 'feelings_l2', 'delighted', 'vô cùng thích thú', '/dɪˈlaɪ.tɪd/', 'I feel delighted when I learn English with Dino.', 'Bé cảm thấy vô cùng thích thú khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w05_proud', 'feelings_l2', 'proud', 'tự hào về bản thân', '/praʊd/', 'I feel proud when I learn English with Dino.', 'Bé cảm thấy tự hào về bản thân khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w06_grateful', 'feelings_l2', 'grateful', 'biết ơn chân thành', '/ˈɡreɪt.fəl/', 'I feel grateful when I learn English with Dino.', 'Bé cảm thấy biết ơn chân thành khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w07_loving', 'feelings_l2', 'loving', 'giàu tình cảm', '/ˈlʌv.ɪŋ/', 'I feel loving when I learn English with Dino.', 'Bé cảm thấy giàu tình cảm khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w08_playful', 'feelings_l2', 'playful', 'nghịch ngợm vui tươi', '/ˈpleɪ.fəl/', 'I feel playful when I learn English with Dino.', 'Bé cảm thấy nghịch ngợm vui tươi khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w09_eager', 'feelings_l2', 'eager', 'háo hức chờ đón', '/ˈiː.ɡər/', 'I feel eager when I learn English with Dino.', 'Bé cảm thấy háo hức chờ đón khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l02_w10_pleased', 'feelings_l2', 'pleased', 'vừa lòng ưng ý', '/pliːzd/', 'I feel pleased when I learn English with Dino.', 'Bé cảm thấy vừa lòng ưng ý khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w01_peaceful', 'feelings_l3', 'peaceful', 'thanh bình tĩnh lặng', '/ˈpiːs.fəl/', 'I feel peaceful when I learn English with Dino.', 'Bé cảm thấy thanh bình tĩnh lặng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w02_relaxed', 'feelings_l3', 'relaxed', 'thư thái thả lỏng', '/rɪˈlækst/', 'I feel relaxed when I learn English with Dino.', 'Bé cảm thấy thư thái thả lỏng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w03_safe', 'feelings_l3', 'safe', 'an tâm chở che', '/seɪf/', 'I feel safe when I learn English with Dino.', 'Bé cảm thấy an tâm chở che khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w04_cozy', 'feelings_l3', 'cozy', 'ấm cúng dễ chịu', '/ˈkəʊ.zi/', 'I feel cozy when I learn English with Dino.', 'Bé cảm thấy ấm cúng dễ chịu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w05_quiet', 'feelings_l3', 'quiet', 'lặng yên êm đềm', '/ˈkwaɪ.ət/', 'I feel quiet when I learn English with Dino.', 'Bé cảm thấy lặng yên êm đềm khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w06_gentle', 'feelings_l3', 'gentle', 'dịu dàng ôn hòa', '/ˈdʒen.təl/', 'I feel gentle when I learn English with Dino.', 'Bé cảm thấy dịu dàng ôn hòa khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w07_content', 'feelings_l3', 'content', 'hài lòng thỏa nguyện', '/kənˈtent/', 'I feel content when I learn English with Dino.', 'Bé cảm thấy hài lòng thỏa nguyện khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w08_patient', 'feelings_l3', 'patient', 'kiên nhẫn đợi chờ', '/ˈpeɪ.ʃənt/', 'I feel patient when I learn English with Dino.', 'Bé cảm thấy kiên nhẫn đợi chờ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w09_hopeful', 'feelings_l3', 'hopeful', 'tràn đầy hy vọng', '/ˈhəʊp.fəl/', 'I feel hopeful when I learn English with Dino.', 'Bé cảm thấy tràn đầy hy vọng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l03_w10_friendly', 'feelings_l3', 'friendly', 'thân thiện hòa đồng', '/ˈfrend.li/', 'I feel friendly when I learn English with Dino.', 'Bé cảm thấy thân thiện hòa đồng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w01_upset', 'feelings_l4', 'upset', 'bực bội không vui', '/ʌpˈset/', 'I feel upset when I learn English with Dino.', 'Bé cảm thấy bực bội không vui khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w02_worried', 'feelings_l4', 'worried', 'lo lắng băn khoăn', '/ˈwʌr.id/', 'I feel worried when I learn English with Dino.', 'Bé cảm thấy lo lắng băn khoăn khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w03_nervous', 'feelings_l4', 'nervous', 'hồi hộp lo âu', '/ˈnɜː.vəs/', 'I feel nervous when I learn English with Dino.', 'Bé cảm thấy hồi hộp lo âu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w04_bored', 'feelings_l4', 'bored', 'nhàm chán rảnh rỗi', '/bɔːd/', 'I feel bored when I learn English with Dino.', 'Bé cảm thấy nhàm chán rảnh rỗi khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w05_lonely', 'feelings_l4', 'lonely', 'cô đơn một mình', '/ˈləʊn.li/', 'I feel lonely when I learn English with Dino.', 'Bé cảm thấy cô đơn một mình khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w06_grumpy', 'feelings_l4', 'grumpy', 'cau có gắt gỏng', '/ˈɡrʌm.pi/', 'I feel grumpy when I learn English with Dino.', 'Bé cảm thấy cau có gắt gỏng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w07_confused', 'feelings_l4', 'confused', 'bối rối khó hiểu', '/kənˈfjuːzd/', 'I feel confused when I learn English with Dino.', 'Bé cảm thấy bối rối khó hiểu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w08_cranky', 'feelings_l4', 'cranky', 'khó ở mè nheo', '/ˈkræŋ.ki/', 'I feel cranky when I learn English with Dino.', 'Bé cảm thấy khó ở mè nheo khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w09_jealous', 'feelings_l4', 'jealous', 'ghen tị hờn dỗi', '/ˈdʒel.əs/', 'I feel jealous when I learn English with Dino.', 'Bé cảm thấy ghen tị hờn dỗi khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l04_w10_hurt', 'feelings_l4', 'hurt', 'tổn thương buồn lòng', '/hɜːt/', 'I feel hurt when I learn English with Dino.', 'Bé cảm thấy tổn thương buồn lòng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w01_brave', 'feelings_l5', 'brave', 'can đảm dũng cảm', '/breɪv/', 'I feel brave when I learn English with Dino.', 'Bé cảm thấy can đảm dũng cảm khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w02_bold', 'feelings_l5', 'bold', 'mạnh dạn tự tin', '/bəʊld/', 'I feel bold when I learn English with Dino.', 'Bé cảm thấy mạnh dạn tự tin khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w03_strong', 'feelings_l5', 'strong', 'kiên cường mạnh mẽ', '/strɒŋ/', 'I feel strong when I learn English with Dino.', 'Bé cảm thấy kiên cường mạnh mẽ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w04_confident', 'feelings_l5', 'confident', 'tự tin vào chính mình', '/ˈkɒn.fɪ.dənt/', 'I feel confident when I learn English with Dino.', 'Bé cảm thấy tự tin vào chính mình khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w05_determined', 'feelings_l5', 'determined', 'quyết tâm không từ bỏ', '/dɪˈtɜː.mɪnd/', 'I feel determined when I learn English with Dino.', 'Bé cảm thấy quyết tâm không từ bỏ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w06_fearless', 'feelings_l5', 'fearless', 'không sợ hãi hiểm nguy', '/ˈfɪə.ləs/', 'I feel fearless when I learn English with Dino.', 'Bé cảm thấy không sợ hãi hiểm nguy khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w07_heroic', 'feelings_l5', 'heroic', 'khí phách anh hùng', '/hɪˈrəʊ.ɪk/', 'I feel heroic when I learn English with Dino.', 'Bé cảm thấy khí phách anh hùng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w08_energetic', 'feelings_l5', 'energetic', 'tràn đầy năng lượng', '/ˌen.əˈdʒet.ɪk/', 'I feel energetic when I learn English with Dino.', 'Bé cảm thấy tràn đầy năng lượng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w09_spirited', 'feelings_l5', 'spirited', 'hăng hái nhiệt tình', '/ˈspɪr.ɪ.tɪd/', 'I feel spirited when I learn English with Dino.', 'Bé cảm thấy hăng hái nhiệt tình khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l05_w10_ready', 'feelings_l5', 'ready', 'sẵn sàng đương đầu', '/ˈred.i/', 'I feel ready when I learn English with Dino.', 'Bé cảm thấy sẵn sàng đương đầu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w01_kind', 'feelings_l6', 'kind', 'tốt bụng nhân hậu', '/kaɪnd/', 'I feel kind when I learn English with Dino.', 'Bé cảm thấy tốt bụng nhân hậu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w02_caring', 'feelings_l6', 'caring', 'ân cần chu đáo', '/ˈkeə.rɪŋ/', 'I feel caring when I learn English with Dino.', 'Bé cảm thấy ân cần chu đáo khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w03_helpful', 'feelings_l6', 'helpful', 'thích giúp đỡ mọi người', '/ˈhelp.fəl/', 'I feel helpful when I learn English with Dino.', 'Bé cảm thấy thích giúp đỡ mọi người khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w04_generous', 'feelings_l6', 'generous', 'rộng lượng hào phóng', '/ˈdʒen.ər.əs/', 'I feel generous when I learn English with Dino.', 'Bé cảm thấy rộng lượng hào phóng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w05_polite', 'feelings_l6', 'polite', 'lịch sự nhã nhặn', '/pəˈlaɪt/', 'I feel polite when I learn English with Dino.', 'Bé cảm thấy lịch sự nhã nhặn khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w06_sweet', 'feelings_l6', 'sweet', 'ngọt ngào dễ thương', '/swiːt/', 'I feel sweet when I learn English with Dino.', 'Bé cảm thấy ngọt ngào dễ thương khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w07_sympathetic', 'feelings_l6', 'sympathetic', 'đồng cảm sẻ chia', '/ˌsɪm.pəˈθet.ɪk/', 'I feel sympathetic when I learn English with Dino.', 'Bé cảm thấy đồng cảm sẻ chia khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w08_warm', 'feelings_l6', 'warm', 'ấm áp tình người', '/wɔːm/', 'I feel warm when I learn English with Dino.', 'Bé cảm thấy ấm áp tình người khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w09_sharing', 'feelings_l6', 'sharing', 'biết chia phần bạn bè', '/ˈʃeə.rɪŋ/', 'I feel sharing when I learn English with Dino.', 'Bé cảm thấy biết chia phần bạn bè khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l06_w10_forgiving', 'feelings_l6', 'forgiving', 'khoan dung tha thứ', '/fəˈɡɪv.ɪŋ/', 'I feel forgiving when I learn English with Dino.', 'Bé cảm thấy khoan dung tha thứ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w01_smile', 'feelings_l7', 'smile', 'mỉm cười rạng rỡ', '/smaɪl/', 'I feel smile when I learn English with Dino.', 'Bé cảm thấy mỉm cười rạng rỡ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w02_laugh', 'feelings_l7', 'laugh', 'cười vang giòn giã', '/lɑːf/', 'I feel laugh when I learn English with Dino.', 'Bé cảm thấy cười vang giòn giã khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w03_cry', 'feelings_l7', 'cry', 'khóc nhè rơi lệ', '/kraɪ/', 'I feel cry when I learn English with Dino.', 'Bé cảm thấy khóc nhè rơi lệ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w04_frown', 'feelings_l7', 'frown', 'cau mày khó chịu', '/fraʊn/', 'I feel frown when I learn English with Dino.', 'Bé cảm thấy cau mày khó chịu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w05_giggle', 'feelings_l7', 'giggle', 'cười khúc khích', '/ˈɡɪɡ.əl/', 'I feel giggle when I learn English with Dino.', 'Bé cảm thấy cười khúc khích khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w06_sigh', 'feelings_l7', 'sigh', 'thở dài nhẹ nhõm', '/saɪ/', 'I feel sigh when I learn English with Dino.', 'Bé cảm thấy thở dài nhẹ nhõm khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w07_yawn', 'feelings_l7', 'yawn', 'ngáp ngủ buồn ngủ', '/jɔːn/', 'I feel yawn when I learn English with Dino.', 'Bé cảm thấy ngáp ngủ buồn ngủ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w08_cheer', 'feelings_l7', 'cheer', 'reo hò cổ vũ', '/tʃɪər/', 'I feel cheer when I learn English with Dino.', 'Bé cảm thấy reo hò cổ vũ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w09_pout', 'feelings_l7', 'pout', 'bĩu môi hờn dỗi', '/paʊt/', 'I feel pout when I learn English with Dino.', 'Bé cảm thấy bĩu môi hờn dỗi khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l07_w10_hug', 'feelings_l7', 'hug', 'ôm siết thật chặt', '/hʌɡ/', 'I feel hug when I learn English with Dino.', 'Bé cảm thấy ôm siết thật chặt khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w01_curious', 'feelings_l8', 'curious', 'tò mò ham học hỏi', '/ˈkjʊə.ri.əs/', 'I feel curious when I learn English with Dino.', 'Bé cảm thấy tò mò ham học hỏi khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w02_amazed', 'feelings_l8', 'amazed', 'kinh ngạc sững sờ', '/əˈmeɪzd/', 'I feel amazed when I learn English with Dino.', 'Bé cảm thấy kinh ngạc sững sờ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w03_fascinated', 'feelings_l8', 'fascinated', 'say mê cuốn hút', '/ˈfæs.ɪ.neɪ.tɪd/', 'I feel fascinated when I learn English with Dino.', 'Bé cảm thấy say mê cuốn hút khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w04_wondering', 'feelings_l8', 'wondering', 'tự hỏi băn khoăn', '/ˈwʌn.dər.ɪŋ/', 'I feel wondering when I learn English with Dino.', 'Bé cảm thấy tự hỏi băn khoăn khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w05_inspired', 'feelings_l8', 'inspired', 'được truyền cảm hứng', '/ɪnˈspaɪəd/', 'I feel inspired when I learn English with Dino.', 'Bé cảm thấy được truyền cảm hứng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w06_amused', 'feelings_l8', 'amused', 'cảm thấy buồn cười', '/əˈmjuːzd/', 'I feel amused when I learn English with Dino.', 'Bé cảm thấy cảm thấy buồn cười khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w07_thrilled', 'feelings_l8', 'thrilled', 'vô cùng hào hứng', '/θrɪld/', 'I feel thrilled when I learn English with Dino.', 'Bé cảm thấy vô cùng hào hứng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w08_dreamy', 'feelings_l8', 'dreamy', 'mơ màng viển vông', '/ˈdriː.mi/', 'I feel dreamy when I learn English with Dino.', 'Bé cảm thấy mơ màng viển vông khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w09_alert', 'feelings_l8', 'alert', 'tỉnh táo nhanh nhạy', '/əˈlɜːt/', 'I feel alert when I learn English with Dino.', 'Bé cảm thấy tỉnh táo nhanh nhạy khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l08_w10_creative', 'feelings_l8', 'creative', 'sáng tạo bay bổng', '/kriˈeɪ.tɪv/', 'I feel creative when I learn English with Dino.', 'Bé cảm thấy sáng tạo bay bổng khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w01_friendly', 'feelings_l9', 'friendly', 'thân thiện chan hòa', '/ˈfrend.li/', 'I feel friendly when I learn English with Dino.', 'Bé cảm thấy thân thiện chan hòa khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w02_welcoming', 'feelings_l9', 'welcoming', 'niềm nở đón chào', '/ˈwel.kəm.ɪŋ/', 'I feel welcoming when I learn English with Dino.', 'Bé cảm thấy niềm nở đón chào khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w03_trusting', 'feelings_l9', 'trusting', 'tin tưởng lẫn nhau', '/ˈtrʌs.tɪŋ/', 'I feel trusting when I learn English with Dino.', 'Bé cảm thấy tin tưởng lẫn nhau khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w04_loyal', 'feelings_l9', 'loyal', 'trung thành gắn bó', '/ˈlɔɪ.əl/', 'I feel loyal when I learn English with Dino.', 'Bé cảm thấy trung thành gắn bó khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w05_cooperative', 'feelings_l9', 'cooperative', 'hợp tác ăn ý', '/kəʊˈɒp.ər.ə.tɪv/', 'I feel cooperative when I learn English with Dino.', 'Bé cảm thấy hợp tác ăn ý khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w06_respectful', 'feelings_l9', 'respectful', 'tôn trọng bạn bè', '/rɪˈspekt.fəl/', 'I feel respectful when I learn English with Dino.', 'Bé cảm thấy tôn trọng bạn bè khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w07_caring_buddy', 'feelings_l9', 'caring buddy', 'bạn tốt quan tâm', '/ˈkeə.rɪŋ ˈbʌd.i/', 'I feel caring buddy when I learn English with Dino.', 'Bé cảm thấy bạn tốt quan tâm khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w08_honest', 'feelings_l9', 'honest', 'thành thật trung thực', '/ˈɒn.ɪst/', 'I feel honest when I learn English with Dino.', 'Bé cảm thấy thành thật trung thực khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w09_cheerful_friend', 'feelings_l9', 'cheerful friend', 'người bạn vui tính', '/ˈtʃɪə.fəl frend/', 'I feel cheerful friend when I learn English with Dino.', 'Bé cảm thấy người bạn vui tính khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l09_w10_companion', 'feelings_l9', 'companion', 'bạn đồng hành thân thiết', '/kəmˈpæn.jən/', 'I feel companion when I learn English with Dino.', 'Bé cảm thấy bạn đồng hành thân thiết khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w01_deep_breath', 'feelings_l10', 'deep breath', 'hít thở sâu bình tĩnh', '/diːp breθ/', 'I feel deep breath when I learn English with Dino.', 'Bé cảm thấy hít thở sâu bình tĩnh khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w02_relax', 'feelings_l10', 'relax', 'thả lỏng toàn thân', '/rɪˈlæks/', 'I feel relax when I learn English with Dino.', 'Bé cảm thấy thả lỏng toàn thân khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w03_count_to_ten', 'feelings_l10', 'count to ten', 'đếm từ 1 đến 10', '/kaʊnt tə ten/', 'I feel count to ten when I learn English with Dino.', 'Bé cảm thấy đếm từ 1 đến 10 khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w04_soft_hug', 'feelings_l10', 'soft hug', 'cái ôm êm dịu', '/sɒft hʌɡ/', 'I feel soft hug when I learn English with Dino.', 'Bé cảm thấy cái ôm êm dịu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w05_listen_music', 'feelings_l10', 'listen music', 'nghe nhạc êm dịu', '/ˈlɪs.ən ˈmjuː.zɪk/', 'I feel listen music when I learn English with Dino.', 'Bé cảm thấy nghe nhạc êm dịu khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w06_rest_peaceful', 'feelings_l10', 'rest peaceful', 'nghỉ ngơi thanh thản', '/rest ˈpiːs.fəl/', 'I feel rest peaceful when I learn English with Dino.', 'Bé cảm thấy nghỉ ngơi thanh thản khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w07_smile_again', 'feelings_l10', 'smile again', 'mỉm cười trở lại', '/smaɪl əˈɡen/', 'I feel smile again when I learn English with Dino.', 'Bé cảm thấy mỉm cười trở lại khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w08_share_feeling', 'feelings_l10', 'share feeling', 'tâm sự cùng ba mẹ', '/ʃeər ˈfiː.lɪŋ/', 'I feel share feeling when I learn English with Dino.', 'Bé cảm thấy tâm sự cùng ba mẹ khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w09_calm_down', 'feelings_l10', 'calm down', 'bình tâm trở lại', '/kɑːm daʊn/', 'I feel calm down when I learn English with Dino.', 'Bé cảm thấy bình tâm trở lại khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('feelings_l10_w10_happy_heart', 'feelings_l10', 'happy heart', 'trái tim bình an', '/ˈhæp.i hɑːt/', 'I feel happy heart when I learn English with Dino.', 'Bé cảm thấy trái tim bình an khi được học tiếng Anh cùng bạn Dino.', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w01_walk', 'actions_l1', 'walk', 'đi bộ thong thả', '/wɔːk/', 'Let''s walk together in the sunny park!', 'Chúng mình hãy cùng nhau đi bộ thong thả trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w02_run', 'actions_l1', 'run', 'chạy nhanh về đích', '/rʌn/', 'Let''s run together in the sunny park!', 'Chúng mình hãy cùng nhau chạy nhanh về đích trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w03_jump', 'actions_l1', 'jump', 'nhảy cao chạm trời', '/dʒʌmp/', 'Let''s jump together in the sunny park!', 'Chúng mình hãy cùng nhau nhảy cao chạm trời trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w04_hop', 'actions_l1', 'hop', 'nhảy lò cò một chân', '/hɒp/', 'Let''s hop together in the sunny park!', 'Chúng mình hãy cùng nhau nhảy lò cò một chân trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w05_skip', 'actions_l1', 'skip', 'nhảy chân sáo vui vẻ', '/skɪp/', 'Let''s skip together in the sunny park!', 'Chúng mình hãy cùng nhau nhảy chân sáo vui vẻ trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w06_dance', 'actions_l1', 'dance', 'nhảy múa theo điệu nhạc', '/dɑːns/', 'Let''s dance together in the sunny park!', 'Chúng mình hãy cùng nhau nhảy múa theo điệu nhạc trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w07_crawl', 'actions_l1', 'crawl', 'bò chập chững trên sàn', '/krɔːl/', 'Let''s crawl together in the sunny park!', 'Chúng mình hãy cùng nhau bò chập chững trên sàn trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w08_march', 'actions_l1', 'march', 'bước đều bước một hai', '/mɑːtʃ/', 'Let''s march together in the sunny park!', 'Chúng mình hãy cùng nhau bước đều bước một hai trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w09_dash', 'actions_l1', 'dash', 'lao vút về phía trước', '/dæʃ/', 'Let''s dash together in the sunny park!', 'Chúng mình hãy cùng nhau lao vút về phía trước trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l01_w10_stroll', 'actions_l1', 'stroll', 'tản bộ dạo chơi', '/strəʊl/', 'Let''s stroll together in the sunny park!', 'Chúng mình hãy cùng nhau tản bộ dạo chơi trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w01_clap', 'actions_l2', 'clap', 'vỗ tay hoan hô', '/klæp/', 'Let''s clap together in the sunny park!', 'Chúng mình hãy cùng nhau vỗ tay hoan hô trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w02_wave', 'actions_l2', 'wave', 'vẫy tay chào tạm biệt', '/weɪv/', 'Let''s wave together in the sunny park!', 'Chúng mình hãy cùng nhau vẫy tay chào tạm biệt trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w03_point', 'actions_l2', 'point', 'chỉ tay vào bức tranh', '/pɔɪnt/', 'Let''s point together in the sunny park!', 'Chúng mình hãy cùng nhau chỉ tay vào bức tranh trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w04_hold', 'actions_l2', 'hold', 'nắm giữ chắc chắn', '/həʊld/', 'Let''s hold together in the sunny park!', 'Chúng mình hãy cùng nhau nắm giữ chắc chắn trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w05_catch', 'actions_l2', 'catch', 'bắt lấy quả bóng', '/kætʃ/', 'Let''s catch together in the sunny park!', 'Chúng mình hãy cùng nhau bắt lấy quả bóng trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w06_throw', 'actions_l2', 'throw', 'ném bóng cho bạn', '/θrəʊ/', 'Let''s throw together in the sunny park!', 'Chúng mình hãy cùng nhau ném bóng cho bạn trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w07_push', 'actions_l2', 'push', 'đẩy xe trượt về trước', '/pʊʃ/', 'Let''s push together in the sunny park!', 'Chúng mình hãy cùng nhau đẩy xe trượt về trước trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w08_pull', 'actions_l2', 'pull', 'kéo xe chở đồ chơi', '/pʊl/', 'Let''s pull together in the sunny park!', 'Chúng mình hãy cùng nhau kéo xe chở đồ chơi trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w09_carry', 'actions_l2', 'carry', 'mang vác vật dụng', '/ˈkær.i/', 'Let''s carry together in the sunny park!', 'Chúng mình hãy cùng nhau mang vác vật dụng trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l02_w10_reach', 'actions_l2', 'reach', 'vươn tay với lấy', '/riːtʃ/', 'Let''s reach together in the sunny park!', 'Chúng mình hãy cùng nhau vươn tay với lấy trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w01_kick', 'actions_l3', 'kick', 'sút bóng vào lưới', '/kɪk/', 'Let''s kick together in the sunny park!', 'Chúng mình hãy cùng nhau sút bóng vào lưới trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w02_swing', 'actions_l3', 'swing', 'đu đưa trên xích đu', '/swɪŋ/', 'Let''s swing together in the sunny park!', 'Chúng mình hãy cùng nhau đu đưa trên xích đu trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w03_climb', 'actions_l3', 'climb', 'leo trèo cây cầu trượt', '/klaɪm/', 'Let''s climb together in the sunny park!', 'Chúng mình hãy cùng nhau leo trèo cây cầu trượt trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w04_slide', 'actions_l3', 'slide', 'trượt xuống cầu trượt', '/slaɪd/', 'Let''s slide together in the sunny park!', 'Chúng mình hãy cùng nhau trượt xuống cầu trượt trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w05_stretch', 'actions_l3', 'stretch', 'vươn vai kéo giãn cơ', '/stretʃ/', 'Let''s stretch together in the sunny park!', 'Chúng mình hãy cùng nhau vươn vai kéo giãn cơ trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w06_bend', 'actions_l3', 'bend', 'cúi người chạm mũi chân', '/bend/', 'Let''s bend together in the sunny park!', 'Chúng mình hãy cùng nhau cúi người chạm mũi chân trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w07_twist', 'actions_l3', 'twist', 'xoay người nhịp nhàng', '/twɪst/', 'Let''s twist together in the sunny park!', 'Chúng mình hãy cùng nhau xoay người nhịp nhàng trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w08_roll', 'actions_l3', 'roll', 'lăn tròn trên thảm cỏ', '/rəʊl/', 'Let''s roll together in the sunny park!', 'Chúng mình hãy cùng nhau lăn tròn trên thảm cỏ trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w09_balance', 'actions_l3', 'balance', 'giữ thăng bằng trên vạch', '/ˈbæl.əns/', 'Let''s balance together in the sunny park!', 'Chúng mình hãy cùng nhau giữ thăng bằng trên vạch trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l03_w10_spin', 'actions_l3', 'spin', 'xoay tròn như chong chóng', '/spɪn/', 'Let''s spin together in the sunny park!', 'Chúng mình hãy cùng nhau xoay tròn như chong chóng trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w01_wake_up', 'actions_l4', 'wake up', 'thức giấc đón bình minh', '/weɪk ʌp/', 'Let''s wake up together in the sunny park!', 'Chúng mình hãy cùng nhau thức giấc đón bình minh trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w02_wash_face', 'actions_l4', 'wash face', 'rửa mặt sạch bong', '/wɒʃ feɪs/', 'Let''s wash face together in the sunny park!', 'Chúng mình hãy cùng nhau rửa mặt sạch bong trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w03_brush_teeth', 'actions_l4', 'brush teeth', 'đánh răng trắng sáng', '/brʌʃ tiːθ/', 'Let''s brush teeth together in the sunny park!', 'Chúng mình hãy cùng nhau đánh răng trắng sáng trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w04_eat_food', 'actions_l4', 'eat food', 'ăn cơm ngon lành', '/iːt fuːd/', 'Let''s eat food together in the sunny park!', 'Chúng mình hãy cùng nhau ăn cơm ngon lành trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w05_drink_water', 'actions_l4', 'drink water', 'uống nước đều đặn', '/drɪŋk ˈwɔː.tər/', 'Let''s drink water together in the sunny park!', 'Chúng mình hãy cùng nhau uống nước đều đặn trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w06_get_dressed', 'actions_l4', 'get dressed', 'mặc quần áo gọn gàng', '/ɡet drest/', 'Let''s get dressed together in the sunny park!', 'Chúng mình hãy cùng nhau mặc quần áo gọn gàng trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w07_go_sleep', 'actions_l4', 'go sleep', 'đi ngủ đúng giờ', '/ɡəʊ sliːp/', 'Let''s go sleep together in the sunny park!', 'Chúng mình hãy cùng nhau đi ngủ đúng giờ trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w08_take_rest', 'actions_l4', 'take rest', 'nghỉ ngơi dưỡng sức', '/teɪk rest/', 'Let''s take rest together in the sunny park!', 'Chúng mình hãy cùng nhau nghỉ ngơi dưỡng sức trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w09_take_bath', 'actions_l4', 'take bath', 'tắm rửa thơm tho', '/teɪk bɑːθ/', 'Let''s take bath together in the sunny park!', 'Chúng mình hãy cùng nhau tắm rửa thơm tho trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l04_w10_pack_bag', 'actions_l4', 'pack bag', 'xếp sách vở vào cặp', '/pæk bæɡ/', 'Let''s pack bag together in the sunny park!', 'Chúng mình hãy cùng nhau xếp sách vở vào cặp trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w01_talk', 'actions_l5', 'talk', 'trò chuyện cùng bạn', '/tɔːk/', 'Let''s talk together in the sunny park!', 'Chúng mình hãy cùng nhau trò chuyện cùng bạn trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w02_listen', 'actions_l5', 'listen', 'lắng nghe chăm chú', '/ˈlɪs.ən/', 'Let''s listen together in the sunny park!', 'Chúng mình hãy cùng nhau lắng nghe chăm chú trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w03_speak', 'actions_l5', 'speak', 'phát âm chuẩn tiếng Anh', '/spiːk/', 'Let''s speak together in the sunny park!', 'Chúng mình hãy cùng nhau phát âm chuẩn tiếng Anh trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w04_whisper', 'actions_l5', 'whisper', 'thì thầm bí mật nhỏ', '/ˈwɪs.pər/', 'Let''s whisper together in the sunny park!', 'Chúng mình hãy cùng nhau thì thầm bí mật nhỏ trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w05_shout', 'actions_l5', 'shout', 'reo to phấn khích', '/ʃaʊt/', 'Let''s shout together in the sunny park!', 'Chúng mình hãy cùng nhau reo to phấn khích trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w06_sing', 'actions_l5', 'sing', 'hát vang khúc ca hay', '/sɪŋ/', 'Let''s sing together in the sunny park!', 'Chúng mình hãy cùng nhau hát vang khúc ca hay trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w07_ask', 'actions_l5', 'ask', 'hỏi điều bé chưa biết', '/ɑːsk/', 'Let''s ask together in the sunny park!', 'Chúng mình hãy cùng nhau hỏi điều bé chưa biết trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w08_answer', 'actions_l5', 'answer', 'trả lời câu hỏi đúng', '/ˈɑːn.sər/', 'Let''s answer together in the sunny park!', 'Chúng mình hãy cùng nhau trả lời câu hỏi đúng trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w09_explain', 'actions_l5', 'explain', 'giải thích rõ ràng', '/ɪkˈspleɪn/', 'Let''s explain together in the sunny park!', 'Chúng mình hãy cùng nhau giải thích rõ ràng trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l05_w10_greet', 'actions_l5', 'greet', 'chào hỏi lễ phép', '/ɡriːt/', 'Let''s greet together in the sunny park!', 'Chúng mình hãy cùng nhau chào hỏi lễ phép trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w01_read', 'actions_l6', 'read', 'đọc truyện tranh hay', '/riːd/', 'Let''s read together in the sunny park!', 'Chúng mình hãy cùng nhau đọc truyện tranh hay trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w02_write', 'actions_l6', 'write', 'viết từng nét chữ đẹp', '/raɪt/', 'Let''s write together in the sunny park!', 'Chúng mình hãy cùng nhau viết từng nét chữ đẹp trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w03_count', 'actions_l6', 'count', 'đếm từ một đến mười', '/kaʊnt/', 'Let''s count together in the sunny park!', 'Chúng mình hãy cùng nhau đếm từ một đến mười trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w04_draw', 'actions_l6', 'draw', 'vẽ chú khủng long Dino', '/drɔː/', 'Let''s draw together in the sunny park!', 'Chúng mình hãy cùng nhau vẽ chú khủng long Dino trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w05_think', 'actions_l6', 'think', 'suy nghĩ tìm đáp án', '/θɪŋk/', 'Let''s think together in the sunny park!', 'Chúng mình hãy cùng nhau suy nghĩ tìm đáp án trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w06_learn', 'actions_l6', 'learn', 'học từ vựng mới mỗi ngày', '/lɜːn/', 'Let''s learn together in the sunny park!', 'Chúng mình hãy cùng nhau học từ vựng mới mỗi ngày trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w07_remember', 'actions_l6', 'remember', 'ghi nhớ bài học lâu', '/rɪˈmem.bər/', 'Let''s remember together in the sunny park!', 'Chúng mình hãy cùng nhau ghi nhớ bài học lâu trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w08_guess', 'actions_l6', 'guess', 'đoán hình trong trò chơi', '/ɡes/', 'Let''s guess together in the sunny park!', 'Chúng mình hãy cùng nhau đoán hình trong trò chơi trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w09_discover', 'actions_l6', 'discover', 'khám phá bao điều lạ', '/dɪˈskʌv.ər/', 'Let''s discover together in the sunny park!', 'Chúng mình hãy cùng nhau khám phá bao điều lạ trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l06_w10_understand', 'actions_l6', 'understand', 'thấu hiểu kiến thức hay', '/ˌʌn.dəˈstænd/', 'Let''s understand together in the sunny park!', 'Chúng mình hãy cùng nhau thấu hiểu kiến thức hay trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w01_help', 'actions_l7', 'help', 'giúp đỡ ông bà cha mẹ', '/help/', 'Let''s help together in the sunny park!', 'Chúng mình hãy cùng nhau giúp đỡ ông bà cha mẹ trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w02_share', 'actions_l7', 'share', 'chia sẻ đồ ăn ngon', '/ʃeər/', 'Let''s share together in the sunny park!', 'Chúng mình hãy cùng nhau chia sẻ đồ ăn ngon trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w03_give', 'actions_l7', 'give', 'trao quà tận tay bạn', '/ɡɪv/', 'Let''s give together in the sunny park!', 'Chúng mình hãy cùng nhau trao quà tận tay bạn trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w04_care', 'actions_l7', 'care', 'quan tâm chăm sóc em bé', '/keər/', 'Let''s care together in the sunny park!', 'Chúng mình hãy cùng nhau quan tâm chăm sóc em bé trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w05_hug', 'actions_l7', 'hug', 'ôm chặt người thân yêu', '/hʌɡ/', 'Let''s hug together in the sunny park!', 'Chúng mình hãy cùng nhau ôm chặt người thân yêu trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w06_smile', 'actions_l7', 'smile', 'mỉm cười chan hòa', '/smaɪl/', 'Let''s smile together in the sunny park!', 'Chúng mình hãy cùng nhau mỉm cười chan hòa trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w07_fix', 'actions_l7', 'fix', 'sửa chữa đồ chơi hỏng', '/fɪks/', 'Let''s fix together in the sunny park!', 'Chúng mình hãy cùng nhau sửa chữa đồ chơi hỏng trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w08_clean_up', 'actions_l7', 'clean up', 'dọn dẹp góc học tập', '/kliːn ʌp/', 'Let''s clean up together in the sunny park!', 'Chúng mình hãy cùng nhau dọn dẹp góc học tập trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w09_tidy', 'actions_l7', 'tidy', 'sắp xếp phòng ngăn nắp', '/ˈtaɪ.di/', 'Let''s tidy together in the sunny park!', 'Chúng mình hãy cùng nhau sắp xếp phòng ngăn nắp trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l07_w10_protect', 'actions_l7', 'protect', 'bảo vệ cây xanh hoa lá', '/prəˈtekt/', 'Let''s protect together in the sunny park!', 'Chúng mình hãy cùng nhau bảo vệ cây xanh hoa lá trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w01_paint', 'actions_l8', 'paint', 'tô màu bức tranh đẹp', '/peɪnt/', 'Let''s paint together in the sunny park!', 'Chúng mình hãy cùng nhau tô màu bức tranh đẹp trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w02_color', 'actions_l8', 'color', 'tô kín hình vẽ', '/ˈkʌl.ər/', 'Let''s color together in the sunny park!', 'Chúng mình hãy cùng nhau tô kín hình vẽ trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w03_cut_paper', 'actions_l8', 'cut paper', 'cắt giấy thủ công', '/kʌt ˈpeɪ.pər/', 'Let''s cut paper together in the sunny park!', 'Chúng mình hãy cùng nhau cắt giấy thủ công trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w04_glue', 'actions_l8', 'glue', 'dán keo chắc chắn', '/ɡluː/', 'Let''s glue together in the sunny park!', 'Chúng mình hãy cùng nhau dán keo chắc chắn trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w05_fold', 'actions_l8', 'fold', 'gấp máy bay giấy', '/fəʊld/', 'Let''s fold together in the sunny park!', 'Chúng mình hãy cùng nhau gấp máy bay giấy trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w06_build', 'actions_l8', 'build', 'xây lâu đài cát', '/bɪld/', 'Let''s build together in the sunny park!', 'Chúng mình hãy cùng nhau xây lâu đài cát trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w07_play_music', 'actions_l8', 'play music', 'chơi đàn tính tang', '/pleɪ ˈmjuː.zɪk/', 'Let''s play music together in the sunny park!', 'Chúng mình hãy cùng nhau chơi đàn tính tang trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w08_act', 'actions_l8', 'act', 'hóa thân đóng kịch', '/ækt/', 'Let''s act together in the sunny park!', 'Chúng mình hãy cùng nhau hóa thân đóng kịch trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w09_mold_clay', 'actions_l8', 'mold clay', 'nặn đất sét hình thú', '/məʊld kleɪ/', 'Let''s mold clay together in the sunny park!', 'Chúng mình hãy cùng nhau nặn đất sét hình thú trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l08_w10_create', 'actions_l8', 'create', 'sáng tạo điều mới mẻ', '/kriˈeɪt/', 'Let''s create together in the sunny park!', 'Chúng mình hãy cùng nhau sáng tạo điều mới mẻ trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w01_swim', 'actions_l9', 'swim', 'bơi lội trong hồ xanh', '/swɪm/', 'Let''s swim together in the sunny park!', 'Chúng mình hãy cùng nhau bơi lội trong hồ xanh trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w02_ride_bike', 'actions_l9', 'ride bike', 'đạp xe trong công viên', '/raɪd baɪk/', 'Let''s ride bike together in the sunny park!', 'Chúng mình hãy cùng nhau đạp xe trong công viên trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w03_fly_kite', 'actions_l9', 'fly kite', 'thả diều bay vút cao', '/flaɪ kaɪt/', 'Let''s fly kite together in the sunny park!', 'Chúng mình hãy cùng nhau thả diều bay vút cao trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w04_camp', 'actions_l9', 'camp', 'cắm trại trên đồi cỏ', '/kæmp/', 'Let''s camp together in the sunny park!', 'Chúng mình hãy cùng nhau cắm trại trên đồi cỏ trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w05_plant', 'actions_l9', 'plant', 'trồng cây giống non', '/plɑːnt/', 'Let''s plant together in the sunny park!', 'Chúng mình hãy cùng nhau trồng cây giống non trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w06_water', 'actions_l9', 'water', 'tưới cây mỗi buổi chiều', '/ˈwɔː.tər/', 'Let''s water together in the sunny park!', 'Chúng mình hãy cùng nhau tưới cây mỗi buổi chiều trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w07_explore', 'actions_l9', 'explore', 'thám hiểm khu vườn nhỏ', '/ɪkˈsplɔːr/', 'Let''s explore together in the sunny park!', 'Chúng mình hãy cùng nhau thám hiểm khu vườn nhỏ trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w08_hike', 'actions_l9', 'hike', 'leo núi dã ngoại', '/haɪk/', 'Let''s hike together in the sunny park!', 'Chúng mình hãy cùng nhau leo núi dã ngoại trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w09_row_boat', 'actions_l9', 'row boat', 'chèo thuyền trên hồ', '/rəʊ bəʊt/', 'Let''s row boat together in the sunny park!', 'Chúng mình hãy cùng nhau chèo thuyền trên hồ trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l09_w10_skate', 'actions_l9', 'skate', 'trượt pa-tin điêu luyện', '/skeɪt/', 'Let''s skate together in the sunny park!', 'Chúng mình hãy cùng nhau trượt pa-tin điêu luyện trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w01_try_again', 'actions_l10', 'try again', 'thử lại khi chưa làm được', '/traɪ əˈɡen/', 'Let''s try again together in the sunny park!', 'Chúng mình hãy cùng nhau thử lại khi chưa làm được trong công viên đầy nắng nhé!', 'star.fill', 1)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w02_work_hard', 'actions_l10', 'work hard', 'chăm chỉ không nản lòng', '/wɜːk hɑːd/', 'Let''s work hard together in the sunny park!', 'Chúng mình hãy cùng nhau chăm chỉ không nản lòng trong công viên đầy nắng nhé!', 'star.fill', 2)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w03_cheer_up', 'actions_l10', 'cheer up', 'khích lệ tinh thần bạn', '/tʃɪər ʌp/', 'Let''s cheer up together in the sunny park!', 'Chúng mình hãy cùng nhau khích lệ tinh thần bạn trong công viên đầy nắng nhé!', 'star.fill', 3)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w04_celebrate', 'actions_l10', 'celebrate', 'ăn mừng thành tích mới', '/ˈsel.ə.breɪt/', 'Let''s celebrate together in the sunny park!', 'Chúng mình hãy cùng nhau ăn mừng thành tích mới trong công viên đầy nắng nhé!', 'star.fill', 4)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w05_say_thanks', 'actions_l10', 'say thanks', 'nói lời cảm ơn chân thành', '/seɪ θæŋks/', 'Let''s say thanks together in the sunny park!', 'Chúng mình hãy cùng nhau nói lời cảm ơn chân thành trong công viên đầy nắng nhé!', 'star.fill', 5)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w06_share_joy', 'actions_l10', 'share joy', 'lan tỏa niềm vui tươi', '/ʃeər dʒɔɪ/', 'Let''s share joy together in the sunny park!', 'Chúng mình hãy cùng nhau lan tỏa niềm vui tươi trong công viên đầy nắng nhé!', 'star.fill', 6)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w07_listen_well', 'actions_l10', 'listen well', 'lắng nghe lời thầy cô', '/ˈlɪs.ən wel/', 'Let''s listen well together in the sunny park!', 'Chúng mình hãy cùng nhau lắng nghe lời thầy cô trong công viên đầy nắng nhé!', 'star.fill', 7)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w08_be_gentle', 'actions_l10', 'be gentle', 'hành động thật nhẹ nhàng', '/bi ˈdʒen.təl/', 'Let''s be gentle together in the sunny park!', 'Chúng mình hãy cùng nhau hành động thật nhẹ nhàng trong công viên đầy nắng nhé!', 'star.fill', 8)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w09_cooperate', 'actions_l10', 'cooperate', 'hợp tác vui cùng bạn bè', '/kəʊˈɒp.ər.eɪt/', 'Let''s cooperate together in the sunny park!', 'Chúng mình hãy cùng nhau hợp tác vui cùng bạn bè trong công viên đầy nắng nhé!', 'star.fill', 9)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;
INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES ('actions_l10_w10_keep_smiling', 'actions_l10', 'keep smiling', 'luôn giữ nụ cười trên môi', '/kiːp ˈsmaɪ.lɪŋ/', 'Let''s keep smiling together in the sunny park!', 'Chúng mình hãy cùng nhau luôn giữ nụ cười trên môi trong công viên đầy nắng nhé!', 'star.fill', 10)
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;

-- 4. SEED 12 THEMED SONGS
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_animals', 'animals', 'Animal Friends Chant', '["Cat says meow, meow, meow!","Dog says woof, woof, woof!","Bird flies high up in the sky,","Happy animals, waving goodbye!"]'::jsonb, '["Mèo kêu meo, meo, meo!","Chó con sủa gâu, gâu, gâu!","Chim tung cánh bay lượn trên trời cao,","Những người bạn động vật vui vẻ vẫy tay chào!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_colors', 'colors', 'Rainbow Colors Song', '["Red and yellow, blue and green,","The prettiest rainbow ever seen!","Purple, orange, shining bright,","Colors fill our world with light!"]'::jsonb, '["Đỏ và vàng, xanh dương cùng xanh lá,","Cầu vồng đẹp nhất bé từng trông thấy!","Sắc tím, sắc cam tỏa sáng lung linh,","Muôn màu lấp lánh thắp sáng quanh mình!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_fruits', 'fruits', 'Yummy Fruits Rhyme', '["Apples, bananas, sweet and nice,","Juicy watermelon, slice by slice!","Strawberries and oranges, yum yum yum,","Healthy fruit treats for everyone!"]'::jsonb, '["Táo và chuối thơm ngọt lành,","Dưa hấu mọng nước từng lát cắt đều,","Dâu tây và cam thơm ngon tuyệt cú mèo,","Hoa quả bổ dưỡng cho tất cả chúng ta!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_family', 'family', 'Family Love Song', '["Mother, father, sister, brother,","We love and care for one another!","Grandpa, grandma, baby too,","Family brings warm hugs to you!"]'::jsonb, '["Mẹ yêu, bố hiền, chị gái và anh trai,","Cùng yêu thương và chăm sóc lẫn nhau!","Có cả ông bà và em bé nhỏ xinh,","Gia đình trao bé những cái ôm ấm áp ân tình!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_food', 'food', 'Delicious Food Chant', '["Warm fresh bread and creamy milk,","Crunchy veggies, smooth as silk!","Eat good food to grow up strong,","Sing our healthy dinner song!"]'::jsonb, '["Bánh mì nóng giòn và sữa thơm béo ngậy,","Rau củ giòn tươi mướt mát lành,","Ăn uống đủ chất để bé lớn thật nhanh,","Cùng hát vang bài ca bữa tối ngon lành!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_body', 'body', 'My Body Clap Song', '["Touch your head and touch your toes,","Open your eyes and point to your nose!","Clap your hands and stomp your feet,","Dino dance to the happy beat!"]'::jsonb, '["Chạm tay lên đầu rồi chạm xuống ngón chân,","Mở to đôi mắt và chỉ vào mũi xinh,","Vỗ đôi bàn tay rồi giậm bước chân nhanh,","Dino cùng nhảy theo điệu nhạc tưng bừng!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_school', 'school', 'School Day Fun', '["Pencil, paper, book in hand,","Let''s explore the learning land!","Count to ten and ABC,","School is fun for you and me!"]'::jsonb, '["Bút chì, trang giấy, sách sẵn trên tay,","Cùng khám phá vùng đất học tập mê say!","Đếm một đến mười và hát chữ ABC,","Trường lớp thân thương tràn ngập niềm vui!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_nature', 'nature', 'Nature Wonders Song', '["Sun in the morning, moon at night,","Stars are twinkling clear and bright!","Rain falls down on tree and flower,","Nature has a magic power!"]'::jsonb, '["Mặt trời đón sớm mai, vầng trăng soi màn đêm,","Những ngôi sao lấp lánh sáng ngời êm đềm!","Mưa rơi tưới mát cây xanh và hoa lá,","Thiên nhiên chứa đựng muôn phép màu kỳ lạ!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_vehicles', 'vehicles', 'Beep Beep Vehicle Song', '["Cars go beep and buses roll,","Trains ride fast along the track!","Airplanes flying high in cloud,","Sailboats glide across the sea!"]'::jsonb, '["Ô tô bíp bíp, xe buýt lăn bánh đều,","Đoàn tàu hỏa lướt nhanh trên đường ray ray,","Máy bay lượn bay trên tầng mây cao vút,","Thuyền buồm căng gió lướt sóng biển khơi!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_clothing', 'clothing', 'My Favorite Clothes', '["Put on your shirt and tie your shoe,","A pretty jacket, bright and new!","Warm winter coat or summer hat,","Dress up neatly, just like that!"]'::jsonb, '["Mặc áo sơ mi và buộc dây giày xinh,","Chiếc áo khoác đẹp đẽ, tươi sáng tinh tươm!","Áo ấm mùa đông hay chiếc mũ che nắng hè,","Mặc đồ gọn gàng, đẹp mắt thế này này!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_feelings', 'feelings', 'How Do You Feel Today?', '["When I am happy, I smile wide!","When I am curious, I step outside!","Take a deep breath if you feel sad,","Dino hugs make everyone glad!"]'::jsonb, '["Khi bé vui sướng, nở nụ cười thật tươi!","Khi bé tò mò, bước ra ngắm đất trời!","Hãy hít thở thật sâu nếu có lúc bé buồn lòng,","Cái ôm của Dino sưởi ấm mọi con tim!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;
INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES ('song_actions', 'actions', 'Let''s Move and Play!', '["Jump up high and touch the sky!","Spin around and wave goodbye!","Walk and run and smile so bright,","Learning with Dino is pure delight!"]'::jsonb, '["Nhảy thật cao lên chạm đến trời xanh!","Xoay một vòng tròn rồi vẫy tay chào vui!","Đi bộ, chạy nhanh và nở nụ cười rạng rỡ,","Học cùng Dino là niềm hạnh phúc tuyệt vời!"]'::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;

-- 5. SEED ACHIEVEMENTS
INSERT INTO public.achievements (id, title, description, icon_url)
VALUES ('first_word', 'Bước Chân Đầu Tiên', 'Bé hoàn thành bài học từ vựng đầu tiên cùng Dino', '🐾')
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, icon_url = EXCLUDED.icon_url;
INSERT INTO public.achievements (id, title, description, icon_url)
VALUES ('streak_3', 'Chiến Binh Chăm Chỉ', 'Học liên tục 3 ngày không nghỉ', '🔥')
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, icon_url = EXCLUDED.icon_url;
INSERT INTO public.achievements (id, title, description, icon_url)
VALUES ('star_50', 'Ngôi Sao Sáng', 'Thu thập 50 ngôi sao vàng lấp lánh', '⭐')
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, icon_url = EXCLUDED.icon_url;
INSERT INTO public.achievements (id, title, description, icon_url)
VALUES ('topic_master', 'Thạc Sĩ Động Vật', 'Hoàn thành trọn vẹn 10 bài học chủ đề Con vật', '🦁')
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, icon_url = EXCLUDED.icon_url;
INSERT INTO public.achievements (id, title, description, icon_url)
VALUES ('dino_level_5', 'Dino Trưởng Thành', 'Đưa Dino tiến hóa lên Cấp độ 5', '🦖')
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, icon_url = EXCLUDED.icon_url;

COMMIT;
