import SwiftUI

/// Kiểu nút 3D nổi pastel chuẩn HTML Preview với hiệu ứng lún khi nhấn
public struct Dino3DButtonStyle: ButtonStyle {
    public var baseColor: Color
    public var shadowColor: Color
    public var textColor: Color
    public var cornerRadius: CGFloat
    
    public init(
        baseColor: Color = DinoStyle.yellow,
        shadowColor: Color = DinoStyle.yellowDark,
        textColor: Color = Color(red: 0.41, green: 0.27, blue: 0.03),
        cornerRadius: CGFloat = 20
    ) {
        self.baseColor = baseColor
        self.shadowColor = shadowColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        
        configuration.label
            .font(.system(size: 19, weight: .black, design: .rounded))
            .foregroundStyle(textColor)
            .padding(.vertical, 15)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    // Đáy đổ bóng 3D dày 5pt
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(shadowColor)
                        .offset(y: isPressed ? 1 : 5)
                    
                    // Mặt trên nút với viền trắng nổi
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(
                            LinearGradient(
                                colors: [baseColor.opacity(0.95), baseColor],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(Color.white.opacity(0.85), lineWidth: 2.5)
                        )
                        .offset(y: isPressed ? 4 : 0)
                }
            )
            .offset(y: isPressed ? 3 : 0)
            .animation(.spring(response: 0.2, dampingFraction: 0.6), value: isPressed)
    }
}

/// Nút bấm 3D đa dụng
public struct Dino3DButton: View {
    public var title: String
    public var icon: String?
    public var color: Color
    public var shadowColor: Color
    public var textColor: Color
    public var action: () -> Void
    
    public init(
        _ title: String,
        icon: String? = nil,
        color: Color = DinoStyle.yellow,
        shadowColor: Color = DinoStyle.yellowDark,
        textColor: Color = Color(red: 0.35, green: 0.22, blue: 0.03),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.color = color
        self.shadowColor = shadowColor
        self.textColor = textColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 9) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .bold))
                }
                Text(title)
            }
        }
        .buttonStyle(
            Dino3DButtonStyle(
                baseColor: color,
                shadowColor: shadowColor,
                textColor: textColor
            )
        )
    }
}
