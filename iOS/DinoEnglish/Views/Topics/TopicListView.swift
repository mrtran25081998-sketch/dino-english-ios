import SwiftUI

/// Màn hình chọn chủ đề học tập (12 chủ đề đầy đủ)
public struct TopicListView: View {
    @EnvironmentObject var model: LearningViewModel
    private let topics = DinoContentRepository.shared.topics
    
    public init() {}
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    // Header giới thiệu
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("12 Chủ Đề Khám Phá")
                                .font(.system(size: 26, weight: .black, design: .rounded))
                                .foregroundStyle(DinoStyle.green)
                            
                            Text("Mục tiêu 100 từ vựng mỗi chủ đề chia thành 10 bài học")
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                        }
                        
                        Spacer()
                        
                        DinoMascotView(.study, height: 85)
                    }
                    .padding(.horizontal, 4)
                    
                    // Lưới 12 chủ đề
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)], spacing: 14) {
                        ForEach(topics) { topic in
                            NavigationLink(destination: LessonListView(topic: topic)) {
                                TopicCard(topic: topic, percent: model.topicCompletionPercentage(topic: topic))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
            }
        }
        .navigationTitle("Chọn chủ đề")
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// Thẻ chủ đề với màu pastel và thanh tiến độ
private struct TopicCard: View {
    let topic: DinoTopic
    let percent: Int
    
    var body: some View {
        ZStack {
            // Đáy đổ bóng 3D
            RoundedRectangle(cornerRadius: 22)
                .fill(topic.themeColor.opacity(0.35))
                .offset(y: 4)
            
            // Mặt chính thẻ
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(topic.themeColor.opacity(0.35), lineWidth: 2)
                )
            
            VStack(alignment: .leading, spacing: 10) {
                // Biểu tượng chủ đề với nền tròn
                HStack {
                    ZStack {
                        Circle()
                            .fill(topic.themeColor.opacity(0.18))
                            .frame(width: 46, height: 46)
                        
                        Image(systemName: topic.icon)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(topic.themeColor)
                    }
                    
                    Spacer()
                    
                    Text("\(percent)%")
                        .font(.system(size: 12, weight: .black, design: .rounded))
                        .foregroundStyle(topic.themeColor)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(topic.themeColor.opacity(0.12), in: Capsule())
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(topic.nameVi)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                        .foregroundStyle(DinoStyle.textDark)
                    
                    Text(topic.nameEn)
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                }
                
                // Thanh tiến độ nhỏ
                ProgressView(value: Double(percent), total: 100.0)
                    .tint(topic.themeColor)
                
                HStack {
                    Text("10 bài học")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                    Spacer()
                    Text("100 từ")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundStyle(topic.themeColor)
                }
            }
            .padding(14)
        }
        .padding(.bottom, 4)
    }
}
