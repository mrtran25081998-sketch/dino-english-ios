import SwiftUI

/// Màn hình hồ sơ bé và cài đặt dành cho phụ huynh
public struct ProfileView: View {
    @EnvironmentObject var model: LearningViewModel
    @State private var showResetAlert = false
    @State private var showSignOutAlert = false
    
    public init() {}
    
    public var body: some View {
        Form {
            Section("Thông tin của bé") {
                HStack {
                    Text("Tên gọi:")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                    TextField("Tên bé", text: $model.childName)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundStyle(DinoStyle.green)
                }
                
                HStack {
                    Text("⭐ Ngôi sao vàng:")
                    Spacer()
                    Text("\(model.stars)")
                        .bold()
                        .foregroundStyle(DinoStyle.yellowDark)
                }
                
                HStack {
                    Text("📚 Bài học đã xong:")
                    Spacer()
                    Text("\(model.completedLessonsCount) / 120 bài")
                        .bold()
                        .foregroundStyle(DinoStyle.green)
                }
                
                HStack {
                    Text("🔥 Chuỗi ngày học:")
                    Spacer()
                    Text("\(model.dailyStreak) ngày")
                        .bold()
                        .foregroundStyle(Color.orange)
                }
                
                HStack {
                    Text("🦖 Cấp độ Dino:")
                    Spacer()
                    Text("Cấp \(model.currentMilestone.level) (\(model.currentMilestone.stageName))")
                        .bold()
                        .foregroundStyle(DinoStyle.green)
                }
            }
            
            Section("Cài đặt phát âm") {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Tốc độ giọng đọc mẫu:")
                        Spacer()
                        Text(String(format: "%.2fx", AudioService.shared.speechRate * 2.3))
                            .font(.caption.bold())
                            .foregroundStyle(DinoStyle.green)
                    }
                    
                    Slider(value: Binding(
                        get: { AudioService.shared.speechRate },
                        set: { AudioService.shared.speechRate = $0 }
                    ), in: 0.3...0.55, step: 0.02)
                    .tint(DinoStyle.green)
                }
            }
            
            Section("Quản lý tài khoản & Tiến độ") {
                Button("Đăng xuất tài khoản") {
                    showSignOutAlert = true
                }
                .foregroundStyle(Color.blue)
                
                Button("Đặt lại tiến độ học tập (Xóa sao & bài đã học)", role: .destructive) {
                    showResetAlert = true
                }
            }
            
            Section("Bảo mật & Quyền riêng tư") {
                Text("Dino English là ứng dụng học tiếng Anh bản địa dành cho trẻ nhỏ. Dữ liệu học tập được lưu cục bộ trên thiết bị qua UserDefaults. Ứng dụng không thu thập thông tin định danh, không có quảng cáo của bên thứ ba hay giao dịch mua hàng tự động.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineSpacing(2)
            }
        }
        .navigationTitle("Hồ sơ & Cài đặt")
        .alert("Đặt lại tiến độ học tập?", isPresented: $showResetAlert) {
            Button("Hủy", role: .cancel) {}
            Button("Đặt lại", role: .destructive) {
                model.resetProgress()
            }
        } message: {
            Text("Toàn bộ số sao và các bài học đã hoàn thành sẽ được đưa về ban đầu. Bạn có chắc chắn muốn đặt lại không?")
        }
        .alert("Đăng xuất?", isPresented: $showSignOutAlert) {
            Button("Hủy", role: .cancel) {}
            Button("Đăng xuất", role: .destructive) {
                model.isLoggedIn = false
            }
        } message: {
            Text("Bạn có thể đăng nhập lại bất cứ lúc nào.")
        }
    }
}
