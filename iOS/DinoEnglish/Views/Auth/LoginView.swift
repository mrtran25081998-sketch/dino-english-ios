import SwiftUI

/// Màn hình đăng nhập dành cho phụ huynh và chế độ dùng thử trải nghiệm
public struct LoginView: View {
    @EnvironmentObject var model: LearningViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var showParentNote = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Spacer(minLength: 10)
                    
                    // Linh vật 3D chào đón
                    DinoMascotView(.welcome, height: 190)
                    
                    // Thẻ đăng nhập 3D
                    Dino3DCard {
                        VStack(spacing: 16) {
                            Text("Đồng Hành Cùng Bé")
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .foregroundStyle(DinoStyle.green)
                            
                            Text("Ba mẹ đăng nhập hoặc chọn dùng thử để lưu tiến độ và cùng bé học mỗi ngày.")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                                .multilineTextAlignment(.center)
                            
                            // Tên của bé
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Tên gọi của bé")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .foregroundStyle(DinoStyle.textDark)
                                
                                TextField("Ví dụ: Bé Na, Bé Bon", text: $model.childName)
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    .padding(14)
                                    .background(DinoStyle.cream)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(DinoStyle.cardBorder, lineWidth: 1.5)
                                    )
                            }
                            
                            // Email phụ huynh
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Email ba mẹ")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .foregroundStyle(DinoStyle.textDark)
                                
                                TextField("email@example.com", text: $email)
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    .padding(14)
                                    .background(DinoStyle.cream)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(DinoStyle.cardBorder, lineWidth: 1.5)
                                    )
                            }
                            
                            // Mật khẩu
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Mật khẩu")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .foregroundStyle(DinoStyle.textDark)
                                
                                HStack {
                                    if showPassword {
                                        TextField("Mật khẩu", text: $password)
                                    } else {
                                        SecureField("Mật khẩu", text: $password)
                                    }
                                    
                                    Button {
                                        showPassword.toggle()
                                    } label: {
                                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                            .foregroundStyle(DinoStyle.textMuted)
                                    }
                                }
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .padding(14)
                                .background(DinoStyle.cream)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(DinoStyle.cardBorder, lineWidth: 1.5)
                                    )
                            }
                            
                            // Nút đăng nhập chính
                            Dino3DButton("Đăng Nhập Ngay 🌟", color: DinoStyle.green, shadowColor: DinoStyle.greenDark, textColor: .white) {
                                withAnimation {
                                    model.isLoggedIn = true
                                }
                            }
                            .padding(.top, 4)
                            
                            // Nút dùng thử
                            Button {
                                withAnimation {
                                    model.isLoggedIn = true
                                }
                            } label: {
                                Text("Trải nghiệm ngay không cần mật khẩu ➔")
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundStyle(DinoStyle.green)
                                    .underline()
                            }
                            .padding(.top, 6)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    // Chú thích phụ huynh
                    Button {
                        showParentNote = true
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "info.circle.fill")
                            Text("Chế độ an toàn cho trẻ nhỏ & Lưu trữ cục bộ")
                        }
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.vertical, 10)
            }
        }
        .alert("Thông Tin An Toàn Cho Bé", isPresented: $showParentNote) {
            Button("Đã hiểu", role: .cancel) {}
        } message: {
            Text("Dino English lưu trữ toàn bộ dữ liệu tiến độ và sao học tập an toàn trên thiết bị của bạn. Ứng dụng không thu thập thông tin trẻ em, không chứa quảng cáo bên ngoài.")
        }
    }
}
