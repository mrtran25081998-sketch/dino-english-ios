import SwiftUI

/// Nền trời xanh mây trắng pastel chuẩn thương hiệu Dino English
public struct DinoBackground: View {
    public init() {}
    
    public var body: some View {
        ZStack {
            DinoStyle.backgroundGradient
                .ignoresSafeArea()
            
            // Đám mây trang trí góc trên phải
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "cloud.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(Color.white.opacity(0.65))
                        .offset(x: 20, y: 15)
                }
                Spacer()
            }
            .ignoresSafeArea()
            
            // Đám mây trang trí góc trái
            VStack {
                HStack {
                    Image(systemName: "cloud.fill")
                        .font(.system(size: 65))
                        .foregroundStyle(Color.white.opacity(0.45))
                        .offset(x: -15, y: 90)
                    Spacer()
                }
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}
