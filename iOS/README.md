# Dino English – Native SwiftUI iOS (iOS 17+)

Ứng dụng học tiếng Anh cho trẻ nhỏ với linh vật khủng long Dino 3D, giao diện 3D pastel nổi bật, 12 chủ đề học tập, 1,200 từ vựng và 20 cột mốc trưởng thành.

## 1. Kiến trúc thư mục mã nguồn (Modular Architecture)
Mã nguồn đã được refactor hoàn chỉnh từ file đơn khối thành các module chuyên biệt:
```
iOS/DinoEnglish/
├── Components/
│   ├── DinoStyle.swift            # Bảng màu pastel, gradient và token thiết kế chuẩn
│   ├── Dino3DButton.swift         # ButtonStyle 3D đổ bóng đáy 5pt có hiệu ứng ấn lún
│   ├── Dino3DCard.swift           # Thẻ bo góc pastel có viền trắng và bóng đáy nổi 3D
│   ├── DinoMascotView.swift       # Renderer 14 linh vật 3D thực tế với hiệu ứng nhún
│   └── DinoBackground.swift       # Nền trời xanh mây trắng pastel
├── Models/
│   ├── DinoTopic.swift            # Models: Topic, Lesson, VocabularyWord, DinoSong, QuizQuestion
│   └── DinoEvolution.swift        # Hệ thống 20 cột mốc tiến hóa ánh xạ vào mascot level1..level4
├── Services/
│   ├── AudioService.swift         # AVSpeechSynthesizer phát âm giọng Mỹ chuẩn trẻ em
│   └── SpeechRecognitionService.swift # SFSpeechRecognizer + mic permission & Simulator test
├── Data/
│   ├── DinoContentRepository.swift # Quản lý tải dữ liệu, sinh câu hỏi đố vui thông minh
│   └── DinoContent.json          # 12 chủ đề x 10 bài học x 10 từ = 1,200 từ vựng + 12 bài hát
├── ViewModels/
│   └── LearningViewModel.swift   # Quản lý tiến độ, tích sao, mở khóa bài, chống farm điểm
├── Views/
│   ├── Onboarding/OnboardingView.swift     # Giới thiệu 3 bước với mascot 3D
│   ├── Auth/LoginView.swift                # Đăng nhập phụ huynh & Dùng thử tức thì
│   ├── Home/HomeView.swift                 # Trang chủ Dashboard, banner học tiếp, widget Dino
│   ├── Topics/TopicListView.swift          # Lưới 12 chủ đề với % hoàn thành
│   ├── Topics/LessonListView.swift         # Danh sách 10 bài học mỗi chủ đề với trạng thái khóa/mở
│   ├── Activities/ActivityHubView.swift    # Hub chọn 4 hoạt động tương tác
│   ├── Activities/VocabularyFlashcardView.swift # 10 Thẻ từ vựng flashcard, IPA, câu ví dụ
│   ├── Activities/PronunciationPracticeView.swift # Luyện nói nghe mẫu & nhận diện giọng nói
│   ├── Activities/GameQuizView.swift       # Trò chơi đố vui chọn hình với đáp án nhiễu cùng bài
│   ├── Activities/SongPlayerView.swift     # Hát ca theo giai điệu câu từng câu
│   ├── Reward/RewardCelebrationView.swift  # Màn hình ăn mừng nhận sao và nâng cấp Dino
│   ├── Growth/DinoGrowthView.swift         # Hành trình 20 cột mốc trưởng thành của Dino
│   ├── Profile/ProfileView.swift           # Quản lý hồ sơ bé, tốc độ đọc, đặt lại tiến độ
│   └── MainTabView.swift                   # Điều hướng 4 tab chính: Home, Chủ đề, Dino, Hồ sơ
└── DinoEnglishApp.swift                    # Entry point chính của ứng dụng
```

## 2. Hướng dẫn Build trên macOS với Xcode 16+
1. Mở `iOS/DinoEnglish.xcodeproj` bằng Xcode trên macOS.
2. Chọn Scheme `DinoEnglish` và Simulator mục tiêu (iPhone 15 / iPhone 16 với iOS 17+).
3. Nhấn **Command + R** để biên dịch và khởi chạy.
4. Mọi file mã nguồn và asset `DinoContent.json` đã được đăng ký đầy đủ trong `project.pbxproj`.
5. Khi chạy trên Simulator:
   - Phát âm: sử dụng `AVSpeechSynthesizer` tích hợp của macOS / Simulator.
   - Luyện nói: nút "Thử giả lập phát âm đúng (Simulator)" hỗ trợ kiểm thử flow nhận diện khi Simulator không kết nối microphone vật lý.

## 3. Trạng thái tính năng
- **Hoạt động hoàn chỉnh**:
  - Toàn bộ luồng Onboarding → Login/Demo → Home → Chọn chủ đề → Chọn bài học → Học tập → Nhận thưởng → Dino trưởng thành.
  - Sử dụng 100% hình ảnh khủng long Dino 3D (`mascot-png`), không dùng emoji thay thế.
  - Bộ 1,200 từ vựng với phiên âm quốc tế IPA chuẩn, nghĩa tiếng Việt, câu ví dụ minh họa và 12 bài hát.
  - Hệ thống lưu trữ cục bộ `UserDefaults` lưu sao, bài đã học, chuỗi ngày học và tiến độ 20 cấp độ Dino.
  - Cơ chế chống nhận thưởng lặp lại vô tội vạ (anti-farming rewards).
- **Chế độ Demo / Cần mở rộng cho bản phát hành thương mại**:
  - Đăng nhập: hiện là Demo lưu cục bộ, chưa gắn backend xác thực OAuth/Cloud Sync.
  - Bài hát: đọc từng câu theo nhịp điệu phát âm chuẩn; phát hành chính thức cần bổ sung file âm thanh thu âm bản quyền.
  - Nhận diện giọng nói: sử dụng Speech framework so khớp từ ngữ, không phải bộ chấm điểm âm vị chuyên sâu.
