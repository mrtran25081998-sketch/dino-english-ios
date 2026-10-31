import SwiftUI

/// Thẻ 3D bo góc pastel có viền trắng và đáy đổ bóng nổi theo bản HTML Preview
public struct Dino3DCard<Content: View>: View {
    public var cornerRadius: CGFloat
    public var shadowColor: Color
    public var backgroundColor: Color
    @ViewBuilder public var content: Content
    
    public init(
        cornerRadius: CGFloat = 24,
        shadowColor: Color = DinoStyle.cardBorder,
        backgroundColor: Color = Color.white.opacity(0.96),
        @ViewBuilder content: () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            // Đáy thẻ 3D
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(shadowColor)
                .offset(y: 5)
            
            // Mặt chính thẻ
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.white, lineWidth: 2)
                )
                .shadow(color: Color.black.opacity(0.06), radius: 10, y: 6)
            
            // Nội dung
            content
                .padding(18)
        }
        .padding(.bottom, 5)
    }
}
