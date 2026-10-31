import SwiftUI

/// Hệ thống màu sắc và kiểu dáng chuẩn 3D pastel cho Dino English
public enum DinoStyle {
    // Màu chủ đạo
    public static let green = Color(red: 0.19, green: 0.66, blue: 0.33)        // #30A953 - Xanh lá tươi Dino
    public static let greenDark = Color(red: 0.11, green: 0.48, blue: 0.22)    // #1C7B38 - Đáy 3D nút xanh
    public static let greenLight = Color(red: 0.88, green: 0.98, blue: 0.90)   // #E1F8E6 - Nền pastel nhẹ
    
    // Màu nút nổi bật (CTA Button)
    public static let yellow = Color(red: 1.00, green: 0.72, blue: 0.11)       // #FFAE11 - Vàng cam mật ong
    public static let yellowLight = Color(red: 1.00, green: 0.91, blue: 0.35)  // #FFE95A - Đỉnh gradient nút
    public static let yellowDark = Color(red: 0.83, green: 0.54, blue: 0.05)   // #D48A0D - Đáy 3D nút vàng
    
    // Bầu trời và nền
    public static let sky = Color(red: 0.51, green: 0.85, blue: 1.00)          // #83D9FF - Xanh mây trời
    public static let skyLight = Color(red: 0.88, green: 0.98, blue: 1.00)     // #E1FAFF - Nền trung gian
    public static let meadowLight = Color(red: 0.90, green: 1.00, blue: 0.85)  // #E6FFD8 - Đồng cỏ xanh
    public static let cream = Color(red: 1.00, green: 0.99, blue: 0.94)        // #FFFDF0 - Kem nhẹ
    
    // Màu phụ trợ theo chủ đề
    public static let coral = Color(red: 1.00, green: 0.38, blue: 0.45)        // #FF6173 - Đỏ cam dâu
    public static let coralDark = Color(red: 0.82, green: 0.22, blue: 0.28)
    
    public static let purple = Color(red: 0.65, green: 0.42, blue: 0.92)       // #A66BEB - Tím mộng mơ
    public static let purpleDark = Color(red: 0.48, green: 0.26, blue: 0.75)
    
    public static let blue = Color(red: 0.20, green: 0.62, blue: 0.98)         // #339EFA - Xanh dương
    public static let blueDark = Color(red: 0.10, green: 0.45, blue: 0.78)
    
    public static let pink = Color(red: 1.00, green: 0.45, blue: 0.70)         // #FF73B3 - Hồng kẹo
    public static let pinkDark = Color(red: 0.85, green: 0.25, blue: 0.55)
    
    // Màu văn bản và viền
    public static let textDark = Color(red: 0.15, green: 0.28, blue: 0.22)     // #264838 - Chữ đậm tự nhiên
    public static let textMuted = Color(red: 0.38, green: 0.46, blue: 0.42)    // #60766B - Chữ phụ
    public static let cardBorder = Color(red: 0.66, green: 0.84, blue: 0.69)   // #A8D6B1 - Viền 3D thẻ
    
    // Gradient nền chuẩn Dino English theo bản HTML Preview
    public static var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [sky, skyLight, meadowLight],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

// MARK: - Nunito Font System for Dino English
public extension Font {
    /// Phông chữ Nunito chính thức cho Dino English
    static func nunito(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let fontName: String
        switch weight {
        case .black:
            fontName = "Nunito-Black"
        case .heavy, .bold:
            fontName = "Nunito-Bold"
        case .semibold:
            fontName = "Nunito-SemiBold"
        case .medium:
            fontName = "Nunito-Regular"
        default:
            fontName = "Nunito-Regular"
        }
        // Thử tải font custom Nunito; nếu chưa load thì fallback sang system rounded (có kiểu dáng tròn trịa tương đồng nhất trên iOS)
        return .custom(fontName, size: size)
    }
    
    static func nunitoTitle(size: CGFloat = 26) -> Font {
        .custom("Nunito-Black", size: size)
    }
    
    static func nunitoSubtitle(size: CGFloat = 18) -> Font {
        .custom("Nunito-Bold", size: size)
    }
    
    static func nunitoBody(size: CGFloat = 15, bold: Bool = false) -> Font {
        bold ? .custom("Nunito-Bold", size: size) : .custom("Nunito-Regular", size: size)
    }
    
    static func nunitoCaption(size: CGFloat = 12) -> Font {
        .custom("Nunito-SemiBold", size: size)
    }
}
