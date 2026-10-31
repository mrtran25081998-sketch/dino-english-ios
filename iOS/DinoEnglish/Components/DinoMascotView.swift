import SwiftUI

/// Danh mục toàn bộ 14 linh vật Dino 3D thực tế trong mascot-png (không dùng emoji)
public enum DinoMascot: String, CaseIterable, Identifiable {
    case welcome = "welcome"    // Chào mừng / Onboarding
    case home = "home"          // Trang chủ vẫy tay
    case study = "study"        // Đọc sách từ vựng
    case listen = "listen"      // Lắng nghe phát âm
    case speak = "speak"        // Luyện nói micro
    case game = "game"          // Trò chơi đố vui
    case song = "song"          // Hát ca vui vẻ
    case reward = "reward"      // Cúp phần thưởng
    case clap = "clap"          // Vỗ tay hoan hô
    case think = "think"        // Suy nghĩ tìm đáp án
    case level1 = "level1"      // Trứng nở / Bé sơ sinh
    case level2 = "level2"      // Khám phá / Năng động
    case level3 = "level3"      // Đọc sách / Thông thái
    case level4 = "level4"      // Tốt nghiệp / Trưởng thành
    
    public var id: String { rawValue }
    
    public var accessibilityDescription: String {
        switch self {
        case .welcome: return "Khủng long Dino 3D chào đón bạn"
        case .home: return "Khủng long Dino 3D đeo ba lô vui vẻ"
        case .study: return "Khủng long Dino 3D đang chăm chỉ đọc sách"
        case .listen: return "Khủng long Dino 3D đang chú ý lắng nghe"
        case .speak: return "Khủng long Dino 3D đang luyện nói tiếng Anh"
        case .game: return "Khủng long Dino 3D đang chơi đố vui"
        case .song: return "Khủng long Dino 3D đang hát say sưa"
        case .reward: return "Khủng long Dino 3D ôm cúp ngôi sao vàng"
        case .clap: return "Khủng long Dino 3D vui vẻ vỗ tay khen ngợi"
        case .think: return "Khủng long Dino 3D đang suy nghĩ đáp án"
        case .level1: return "Dino cấp độ 1: Trứng nở khám phá"
        case .level2: return "Dino cấp độ 2: Dino năng động đến trường"
        case .level3: return "Dino cấp độ 3: Dino đọc sách thông thái"
        case .level4: return "Dino cấp độ 4: Dino đội mũ tốt nghiệp đại tài"
        }
    }
}

/// Thành phần hiển thị linh vật 3D Dino với hiệu ứng nhịp thở / nhún nhẹ nhàng
public struct DinoMascotView: View {
    public var mascot: DinoMascot
    public var height: CGFloat
    public var animated: Bool
    
    @State private var isFloating = false
    
    public init(
        _ mascot: DinoMascot = .home,
        height: CGFloat = 180,
        animated: Bool = true
    ) {
        self.mascot = mascot
        self.height = height
        self.animated = animated
    }
    
    public var body: some View {
        Image(mascot.rawValue)
            .resizable()
            .scaledToFit()
            .frame(height: height)
            .shadow(color: Color(red: 0.20, green: 0.45, blue: 0.28).opacity(0.22), radius: 8, y: 7)
            .offset(y: (animated && isFloating) ? -6 : 0)
            .accessibilityLabel(mascot.accessibilityDescription)
            .onAppear {
                if animated {
                    withAnimation(
                        .easeInOut(duration: 1.8)
                        .repeatForever(autoreverses: true)
                    ) {
                        isFloating = true
                    }
                }
            }
    }
}
