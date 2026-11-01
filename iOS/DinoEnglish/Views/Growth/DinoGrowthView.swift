import SwiftUI

/// Màn hình theo dõi hành trình 20 cột mốc Dino trưởng thành
public struct DinoGrowthView: View {
    @EnvironmentObject var model: LearningViewModel
    private let milestones = DinoEvolutionManager.milestones
    
    public init() {}
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // Header linh vật 3D hiện tại
                    Dino3DCard {
                        VStack(spacing: 12) {
                            Text("Dino Trưởng Thành Cùng Bé!")
                                .font(.system(size: 22, weight: .black, design: .rounded))
                                .foregroundStyle(DinoStyle.green)
                            
                            DinoMascotView(model.currentMascot, height: 190)
                            
                            VStack(spacing: 4) {
                                Text("Cấp độ \(model.currentMilestone.level): \(model.currentMilestone.title)")
                                    .font(.system(size: 19, weight: .heavy, design: .rounded))
                                    .foregroundStyle(DinoStyle.textDark)
                                
                                Text(model.currentMilestone.stageName)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundStyle(DinoStyle.green)
                                
                                Text(model.currentMilestone.rewardDescription)
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                    .foregroundStyle(DinoStyle.textMuted)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 2)
                            }
                            
                            // Thanh tiến độ lên cấp tiếp theo
                            VStack(spacing: 4) {
                                HStack {
                                    Text("\(model.completedLessonsCount) bài đã hoàn thành")
                                        .font(.system(size: 12, weight: .bold, design: .rounded))
                                        .foregroundStyle(DinoStyle.textDark)
                                    Spacer()
                                    Text("⭐ \(model.stars) sao")
                                        .font(.system(size: 12, weight: .heavy, design: .rounded))
                                        .foregroundStyle(DinoStyle.yellowDark)
                                }
                                
                                ProgressView(value: model.evolutionProgress)
                                    .tint(DinoStyle.green)
                            }
                            .padding(.top, 4)
                        }
                        .padding(.vertical, 4)
                    }
                    .padding(.horizontal, 16)
                    
                    // Danh sách 20 cột mốc
                    VStack(alignment: .leading, spacing: 10) {
                        Text("20 Cột Mốc Tiến Hóa Của Dino")
                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.textDark)
                            .padding(.horizontal, 20)
                        
                        VStack(spacing: 10) {
                            ForEach(milestones) { milestone in
                                let isUnlocked = model.completedLessonsCount >= milestone.requiredLessons
                                
                                HStack(spacing: 14) {
                                    // Hình ảnh Dino 3D thể hiện sự trưởng thành từng cấp độ
                                    ZStack(alignment: .bottomTrailing) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 16)
                                                .fill(milestone.level == model.currentMilestone.level ? DinoStyle.greenLight.opacity(0.8) : (isUnlocked ? Color(red: 0.94, green: 0.98, blue: 0.95) : Color.gray.opacity(0.1)))
                                                .frame(width: 56, height: 56)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 16)
                                                        .stroke(milestone.level == model.currentMilestone.level ? DinoStyle.green : (isUnlocked ? DinoStyle.greenLight : Color.gray.opacity(0.2)), lineWidth: 2)
                                                )
                                            
                                            DinoMascotView(milestone.mascot, height: 48, animated: false)
                                                .opacity(isUnlocked ? 1.0 : 0.6)
                                                .grayscale(isUnlocked ? 0 : 0.6)
                                        }
                                        
                                        // Biểu tượng huy hiệu nhỏ góc dưới
                                        Image(systemName: milestone.badgeSymbol)
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundStyle(.white)
                                            .padding(3)
                                            .background(isUnlocked ? DinoStyle.green : Color.gray, in: Circle())
                                            .offset(x: 4, y: 4)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        HStack {
                                            Text("Cột mốc \(milestone.level): \(milestone.title)")
                                                .font(.system(size: 15, weight: .heavy, design: .rounded))
                                                .foregroundStyle(isUnlocked ? DinoStyle.textDark : Color.gray)
                                            
                                            Spacer()
                                            
                                            if milestone.level == model.currentMilestone.level {
                                                Text("HIỆN TẠI")
                                                    .font(.system(size: 10, weight: .black, design: .rounded))
                                                    .foregroundStyle(.white)
                                                    .padding(.horizontal, 7)
                                                    .padding(.vertical, 3)
                                                    .background(DinoStyle.green, in: Capsule())
                                            }
                                        }
                                        
                                        Text(milestone.stageName)
                                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                                            .foregroundStyle(isUnlocked ? DinoStyle.green : Color.gray.opacity(0.8))
                                    }
                                    
                                    Text(isUnlocked ? "Đã mở" : "Cần \(milestone.requiredLessons) bài")
                                        .font(.system(size: 12, weight: .bold, design: .rounded))
                                        .foregroundStyle(isUnlocked ? DinoStyle.green : DinoStyle.textMuted)
                                }
                                .padding(14)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(isUnlocked ? DinoStyle.green.opacity(0.3) : Color.gray.opacity(0.2), lineWidth: 1.5)
                                )
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.top, 10)
            }
        }
        .navigationTitle("Dino Trưởng Thành")
        .navigationBarTitleDisplayMode(.inline)
    }
}
