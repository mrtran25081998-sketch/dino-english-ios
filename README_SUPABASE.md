# 🦖 Dino English — Hướng Dẫn Tích Hợp Backend Supabase

Dino English là ứng dụng học tiếng Anh 3D tương tác dành cho trẻ em (12 chủ đề, 120 bài học, 1.200 từ vựng chuẩn Oxford & IPA, 14 linh vật Dino 3D). Tài liệu này hướng dẫn chi tiết cách thiết lập, cấu hình và vận hành Backend Supabase cho cả phiên bản **Web (GitHub Pages)** và **iOS Native (Swift)**.

---

## 1. THÔNG TIN HỆ THỐNG SUPABASE

- **Supabase Project URL:** `https://wsaalmeuduiyqbptnrmy.supabase.co`
- **Project ID:** `wsaalmeuduiyqbptnrmy`
- **Frontend GitHub Pages:** `https://mrtran25081998-sketch.github.io/dino-english-ios/`
- **Supabase Client Library:** `@supabase/supabase-js@2` (Web) & Native REST / URLSession (iOS Swift)

---

## 2. CẤU TRÚC THƯ MỤC BACKEND & DATABASE

```text
├── database/
│   ├── migrations/
│   │   ├── 01_schema.sql         # DDL 11 bảng cốt lõi, khóa ngoại, ràng buộc & trigger updated_at
│   │   ├── 02_rls.sql            # Chính sách bảo mật Row Level Security (RLS) cho tất cả bảng
│   │   └── 03_rpc_functions.sql  # RPC chống gian lận: complete_lesson_activity, create_child_profile, dashboard stats
│   ├── seeds/
│   │   ├── generate_sql_seed.js  # Node script tự động trích xuất JSON thành SQL seed
│   │   └── 01_content_seed.sql   # Seed chuẩn hóa 12 topics, 120 lessons, 1.200 từ vựng & 12 bài hát (719 KB)
│   └── supabase_schema.sql       # File SQL tổng hợp (Master DDL + RLS + Triggers + RPC) chạy 1-click
├── scripts/
│   ├── build_web_preview.js      # Generator HTML Web Simulator tích hợp Supabase Auth & Sync
│   └── verify_content_integrity.js # Script kiểm thử dữ liệu 1.200 từ vựng không trùng lặp
├── iOS/DinoEnglish/Services/
│   └── SupabaseService.swift     # Service native Swift kết nối Supabase REST API & Auth
├── .env.example                  # Mẫu biến môi trường an toàn (chỉ chứa public anon key)
└── index.html                    # Bản build production cho GitHub Pages
```

---

## 3. HƯỚNG DẪN THIẾT LẬP SUPABASE DASHBOARD (THỰC HIỆN THỦ CÔNG)

Phụ huynh/Admin chỉ cần thực hiện 4 bước sau trên Supabase Dashboard:

### Bước 3.1: Khởi tạo Database Schema & RPC Functions
1. Truy cập: [Supabase SQL Editor](https://supabase.com/dashboard/project/wsaalmeuduiyqbptnrmy/sql/new)
2. Mở file `database/supabase_schema.sql` trong mã nguồn.
3. Sao chép toàn bộ nội dung và dán vào ô SQL Editor, sau đó nhấn **Run** (Ctrl + Enter).
4. Kết quả: Tất cả 11 bảng, quan hệ khóa ngoại, RLS policies và hàm RPC chống gian lận sẽ được kích hoạt thành công.

### Bước 3.2: Nạp Dữ Liệu 1.200 Từ Vựng & 12 Chủ Đề (Seed Data)
1. Mở cửa sổ query mới trong SQL Editor.
2. Mở file `database/seeds/01_content_seed.sql` (719 KB).
3. Dán toàn bộ nội dung và nhấn **Run**.
4. Dữ liệu thực tế được nạp đầy đủ:
   - 12 Topics (`animals`, `colors`, `fruits`, `family`, `food`, `body`, `school`, `nature`, `vehicles`, `clothing`, `feelings`, `actions`).
   - 120 Lessons (mỗi chủ đề đúng 10 bài học).
   - 1.200 Vocabulary words (đầy đủ từ tiếng Anh, nghĩa tiếng Việt, phiên âm IPA, câu ví dụ và bản dịch).
   - 12 Bài hát chủ đề tiếng Anh thiếu nhi.
   - 10 Danh hiệu thành tích (Achievements).

### Bước 3.3: Lấy Publishable Anon Key
1. Vào mục: **Project Settings** -> **API** (hoặc [Data API Overview](https://supabase.com/dashboard/project/wsaalmeuduiyqbptnrmy/integrations/data_api/overview))
2. Tìm dòng **Project API keys** -> **`anon` `public`**.
3. Sao chép khóa này (chuỗi bắt đầu bằng `eyJ...`).
4. Dán khóa này vào file `.env` hoặc nhập trực tiếp trên giao diện Đăng Nhập Dino English.

> [!CAUTION]
> Tuyệt đối KHÔNG sử dụng `service_role` key trên frontend hoặc commit lên GitHub.

### Bước 3.4: Cấu hình Auth Redirect URLs cho GitHub Pages
1. Vào mục: **Authentication** -> **URL Configuration**
2. **Site URL:** Nhập:
   ```text
   https://mrtran25081998-sketch.github.io/dino-english-ios/
   ```
3. **Redirect URLs (Thêm các URL sau):**
   ```text
   https://mrtran25081998-sketch.github.io/dino-english-ios/
   https://mrtran25081998-sketch.github.io/dino-english-ios/*
   http://localhost:3000/*
   http://localhost:5173/*
   http://127.0.0.1:5500/*
   ```
4. Nhấn **Save**.

---

## 4. CHI TIẾT THIẾT KẾ CƠ SỞ DỮ LIỆU & RLS POLICIES

| Tên Bảng | Mục Đích | Khóa Chính / Ngoại | Chính Sách RLS |
| :--- | :--- | :--- | :--- |
| `profiles` | Thông tin phụ huynh | `id` -> `auth.users(id)` | Phụ huynh chỉ đọc & sửa bản ghi `id = auth.uid()` |
| `children` | Hồ sơ các bé của phụ huynh | `id` (UUID), `parent_id` | Chỉ phụ huynh sở hữu (`parent_id = auth.uid()`) được xem, tạo, sửa, xóa |
| `topics` | 12 chủ đề học tiếng Anh | `id` (text: animals, colors...) | Public Read-Only (`anon` & `authenticated`) |
| `lessons` | 120 bài học theo chủ đề | `id` (text), `topic_id` | Public Read-Only (`anon` & `authenticated`) |
| `vocabulary` | 1.200 từ vựng chuẩn Oxford & IPA | `id` (UUID), `lesson_id` | Public Read-Only (`anon` & `authenticated`) |
| `songs` | 12 bài hát chủ đề thiếu nhi | `id` (UUID), `topic_id` | Public Read-Only (`anon` & `authenticated`) |
| `learning_progress` | Trạng thái hoàn thành bài học | `id` (UUID), `(child_id, lesson_id)` UNIQUE | Chỉ phụ huynh sở hữu bé được xem & cập nhật |
| `learning_attempts` | Lịch sử chi tiết (Vocab/Pron/Quiz/Song) | `id` (UUID), `child_id` | Chỉ phụ huynh sở hữu bé được ghi nhận và truy vấn |
| `reward_transactions` | Lịch sử cộng sao vàng (chống gian lận) | `(child_id, source_type, source_id)` UNIQUE | Chỉ cho phép ghi qua RPC; Chặn cộng trùng sao |
| `dino_progress` | Cột mốc Dino 20 cấp độ & tổng sao | `id` (UUID), `child_id` UNIQUE | Chỉ phụ huynh sở hữu bé được xem |
| `achievements` | Huy hiệu vinh danh học tập | `id` (text) | Public Read-Only |
| `child_achievements` | Danh hiệu bé đã mở khóa | `(child_id, achievement_id)` UNIQUE | Chỉ phụ huynh sở hữu bé được truy cập |

---

## 5. CƠ CHẾ BẢO MẬT VÀ CHỐNG GIAN LẬN (RPC ANTI-CHEAT)

1. **Hàm RPC `complete_lesson_activity`:**
   - Kiểm tra `child_id` có đúng thuộc quyền quản lý của phụ huynh đang đăng nhập (`auth.uid()`) hay không.
   - Ghi nhận `reward_transactions` với ràng buộc UNIQUE `(child_id, source_type, source_id)` — nếu bé đã nhận sao của bài học này trước đó, hệ thống sẽ bỏ qua việc cộng sao trùng lặp.
   - Tự động tính toán điểm kinh nghiệm và tiến hóa Dino lên cấp độ tương ứng (từ Cấp 1 đến Cấp 20).
   - Tự động đánh dấu `completed` cho bài học khi đạt điều kiện.

2. **Trigger `handle_new_user`:**
   - Ngay khi phụ huynh kích hoạt tài khoản qua Supabase Auth, trigger PostgreSQL tự động khởi tạo hồ sơ phụ huynh trong `profiles`, tạo sẵn 1 hồ sơ bé ban đầu trong `children`, và mở khóa cột mốc Dino Sơ sinh cấp 1 trong `dino_progress`.

---

## 6. QUẢN LÝ NHIỀU BÉ & KHU VỰC PHỤ HUYNH (PARENT DASHBOARD)

- Phụ huynh có thể tạo thêm nhiều hồ sơ cho các con (`child_setup`).
- Chuyển đổi giữa các bé chỉ với 1 chạm.
- Thống kê chi tiết riêng biệt cho từng bé:
  - Tổng số bài học đã hoàn thành / 120 bài.
  - Số từ vựng đã nắm vững (bài học × 10 từ).
  - Thời gian học tập thực tế (phút).
  - Tiến độ % trên từng chủ đề trong 12 chủ đề.
  - Cột mốc Dino trưởng thành & huy hiệu đã đạt.
- Quyền riêng tư: Không lưu ngày sinh chính xác, địa chỉ hoặc số điện thoại của trẻ em. Hỗ trợ xóa toàn bộ dữ liệu theo yêu cầu.
