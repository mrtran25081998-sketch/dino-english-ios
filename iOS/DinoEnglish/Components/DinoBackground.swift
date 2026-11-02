import SwiftUI

/// Nền mây trời đồng cỏ 3D cầu vồng chuẩn thương hiệu Dino English
public struct DinoBackground: View {
    public init() {}
    
    public var body: some View {
        GeometryReader { geo in
            ZStack {
                DinoStyle.backgroundGradient
                
                Image("app_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
            }
            .ignoresSafeArea()
        }
    }
}

