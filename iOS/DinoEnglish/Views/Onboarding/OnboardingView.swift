import SwiftUI

/// Màn hình giới thiệu 3 bước với linh vật 3D Dino
public struct OnboardingView: View {
    @EnvironmentObject var model: LearningModelShim
    @State private var currentPage: Int = 0
    
    private let pages: [(title: String, subtitle: String, mascot: DinoMascot)] = [
        (
            title: "Cùng Dino Khám Phá Tiếng Anh!",
            subtitle: "Học từ vựng chuẩn bản ngữ, phát âm, trò chơi đố vui và bài hát rộn ràng mỗi ngày.",
            mascot: .welcome
        ),
        (
            title: "Học Vui Qua Tương Tác 3D",
            subtitle: "Nghe phát âm rõ ràng, luyện nói qua micro và chơi trò ghép hình nhận sao lấp lánh.",
            mascot: .game
        ),
        (
            title: "Dino Lớn Lên Cùng Bé",
            subtitle: "Tích lũy sao vàng qua 20 cột mốc để mở khóa những diện mạo trưởng thành kỳ diệu của Dino!",
            mascot: .level4
        )
    ]
    
    public init() {}
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            VStack(spacing: 20) {
                Spacer(minLength: 10)
                
                // Tiêu đề thương hiệu
                HStack(spacing: 4) {
                    Text("Dino")
                        .font(.system(size: 38, weight: .black, design: .rounded))
                        .foregroundStyle(DinoStyle.green)
                    Text("English")
                        .font(.system(size: 38, weight: .black, design: .rounded))
                        .foregroundStyle(DinoStyle.yellow)
                }
                .shadow(color: Color.white.opacity(0.8), radius: 2, y: 2)
                
                // Linh vật 3D thực tế
                DinoMascotView(pages[currentPage].mascot, height: 260)
                    .id("mascot_\(currentPage)")
                    .transition(.scale.combined(with: .opacity))
                
                // Thẻ thông tin 3D pastel
                Dino3DCard {
                    VStack(spacing: 12) {
                        Text(pages[currentPage].title)
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.green)
                            .multilineTextAlignment(.center)
                        
                        Text(pages[currentPage].subtitle)
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundStyle(DinoStyle.textMuted)
                            .multilineTextAlignment(.center)
                            .lineSpacing(3)
                    }
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal, 8)
                
                // Chỉ số trang
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { idx in
                        Capsule()
                            .fill(idx == currentPage ? DinoStyle.green : Color.white.opacity(0.7))
                            .frame(width: idx == currentPage ? 28 : 10, height: 10)
                            .shadow(color: Color.black.opacity(0.08), radius: 2, y: 1)
                            .animation(.spring(), value: currentPage)
                    }
                }
                .padding(.vertical, 4)
                
                // Nút chuyển trang 3D
                Dino3DButton(
                    currentPage == pages.count - 1 ? "Bắt Đầu Ngay 🚀" : "Tiếp Theo ➔",
                    color: DinoStyle.yellow,
                    shadowColor: DinoStyle.yellowDark
                ) {
                    if currentPage < pages.count - 1 {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            currentPage += 1
                        }
                    } else {
                        withAnimation {
                            model.isOnboarded = true
                        }
                    }
                }
                .padding(.horizontal, 8)
                
                Spacer(minLength: 12)
            }
            .padding(22)
        }
    }
}
