import SwiftUI

/// Màn hình nhận thưởng và chúc mừng bé hoàn thành bài học
public struct RewardCelebrationView: View {
    public let title: String
    public let subtitle: String
    public let points: Int
    public let mascot: DinoMascot
    public let onContinue: () -> Void
    
    @State private var scaleEffect: CGFloat = 0.5
    @State private var rotateStars: Double = 0
    
    public init(
        title: String = "Chúc Mừng Bé!",
        subtitle: String = "Bé đã hoàn thành xuất sắc hoạt động này",
        points: Int = 5,
        mascot: DinoMascot = .reward,
        onContinue: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.points = points
        self.mascot = mascot
        self.onContinue = onContinue
    }
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            VStack(spacing: 20) {
                Spacer()
                
                // Vòng hào quang ngôi sao lấp lánh
                ZStack {
                    Circle()
                        .fill(DinoStyle.yellowLight.opacity(0.4))
                        .frame(width: 260, height: 260)
                        .scaleEffect(scaleEffect)
                    
                    // Linh vật 3D ôm cúp / vỗ tay
                    DinoMascotView(mascot, height: 230)
                        .scaleEffect(scaleEffect)
                }
                
                // Thẻ thông báo phần thưởng
                Dino3DCard {
                    VStack(spacing: 12) {
                        Text(title)
                            .font(.system(size: 26, weight: .black, design: .rounded))
                            .foregroundStyle(DinoStyle.green)
                            .multilineTextAlignment(.center)
                        
                        Text(subtitle)
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .foregroundStyle(DinoStyle.textMuted)
                            .multilineTextAlignment(.center)
                        
                        // Huy hiệu sao vàng nhận được
                        HStack(spacing: 8) {
                            Text("⭐")
                                .font(.system(size: 30))
                            Text("+\(points) Ngôi Sao Vàng")
                                .font(.system(size: 20, weight: .black, design: .rounded))
                                .foregroundStyle(Color(red: 0.65, green: 0.42, blue: 0.02))
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(DinoStyle.yellowLight.opacity(0.8), in: Capsule())
                        .overlay(Capsule().stroke(DinoStyle.yellowDark.opacity(0.5), lineWidth: 1.5))
                    }
                    .padding(.vertical, 6)
                }
                .padding(.horizontal, 24)
                
                Spacer()
                
                // Nút tiếp tục
                Dino3DButton("Tuyệt Vời! Tiếp Tục Nào ➔", color: DinoStyle.yellow, shadowColor: DinoStyle.yellowDark) {
                    onContinue()
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.65)) {
                scaleEffect = 1.0
            }
            AudioService.shared.speak("Amazing! You got stars!")
        }
    }
}
