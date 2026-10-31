import SwiftUI

/// Màn hình chọn 1 trong 4 hoạt động học tập của bài học đã chọn
public struct ActivityHubView: View {
    @EnvironmentObject var model: LearningViewModel
    public let topic: DinoTopic
    public let lesson: DinoLesson
    
    public init(topic: DinoTopic, lesson: DinoLesson) {
        self.topic = topic
        self.lesson = lesson
    }
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // Header bài học với linh vật 3D
                    Dino3DCard(backgroundColor: topic.themeColor.opacity(0.12)) {
                        HStack(spacing: 16) {
                            DinoMascotView(.study, height: 110)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(topic.nameVi): Bài \(lesson.lessonId)")
                                    .font(.system(size: 20, weight: .black, design: .rounded))
                                    .foregroundStyle(topic.themeColor)
                                
                                Text(lesson.title)
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundStyle(DinoStyle.textDark)
                                
                                Text("\(lesson.wordCount) từ vựng · Hoàn thành các hoạt động để nhận sao!")
                                    .font(.system(size: 12, weight: .medium, design: .rounded))
                                    .foregroundStyle(DinoStyle.textMuted)
                            }
                            Spacer()
                        }
                    }
                    
                    Text("Chọn hoạt động bé muốn làm:")
                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                        .foregroundStyle(DinoStyle.textDark)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 4)
                    
                    // 1. TỪ VỰNG
                    NavigationLink(destination: VocabularyFlashcardView(lesson: lesson)) {
                        HubActionCard(
                            title: "Từ Vựng · Flashcards",
                            subtitle: "Xem 10 thẻ hình ảnh, phiên âm IPA và nghe đọc chuẩn",
                            icon: "character.book.closed.fill",
                            color: DinoStyle.green,
                            mascot: .study,
                            starsReward: "+5 ⭐"
                        )
                    }
                    .buttonStyle(.plain)
                    
                    // 2. PHÁT ÂM
                    NavigationLink(destination: PronunciationPracticeView(lesson: lesson)) {
                        HubActionCard(
                            title: "Phát Âm · Nghe & Nói",
                            subtitle: "Nghe phát âm chuẩn và luyện nói qua micro cùng Dino",
                            icon: "mic.fill",
                            color: DinoStyle.blue,
                            mascot: .speak,
                            starsReward: "+5 ⭐"
                        )
                    }
                    .buttonStyle(.plain)
                    
                    // 3. TRÒ CHƠI
                    NavigationLink(destination: GameQuizView(lesson: lesson)) {
                        HubActionCard(
                            title: "Trò Chơi · Chọn Đúng Hình",
                            subtitle: "Đố vui phản xạ 3D với các từ vừa học trong bài",
                            icon: "gamecontroller.fill",
                            color: DinoStyle.purple,
                            mascot: .game,
                            starsReward: "+10 ⭐"
                        )
                    }
                    .buttonStyle(.plain)
                    
                    // 4. BÀI HÁT
                    if let song = topic.song {
                        NavigationLink(destination: SongPlayerView(song: song)) {
                            HubActionCard(
                                title: "Bài Hát · Giai Điệu Vui",
                                subtitle: song.title,
                                icon: "music.note.list",
                                color: DinoStyle.coral,
                                mascot: .song,
                                starsReward: "+5 ⭐"
                            )
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
            }
        }
        .navigationTitle("Bài \(lesson.lessonId): \(lesson.title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// Thẻ hoạt động trong Hub
private struct HubActionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let mascot: DinoMascot
    let starsReward: String
    
    var body: some View {
        ZStack {
            // Đáy đổ bóng 3D
            RoundedRectangle(cornerRadius: 22)
                .fill(color.opacity(0.35))
                .offset(y: 4)
            
            // Mặt chính
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(color.opacity(0.35), lineWidth: 2)
                )
            
            HStack(spacing: 14) {
                // Biểu tượng tròn
                ZStack {
                    Circle()
                        .fill(color.opacity(0.18))
                        .frame(width: 54, height: 54)
                    
                    Image(systemName: icon)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(title)
                            .font(.system(size: 17, weight: .heavy, design: .rounded))
                            .foregroundStyle(color)
                        
                        Spacer()
                        
                        Text(starsReward)
                            .font(.system(size: 12, weight: .black, design: .rounded))
                            .foregroundStyle(Color(red: 0.65, green: 0.42, blue: 0.02))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(DinoStyle.yellowLight.opacity(0.6), in: Capsule())
                    }
                    
                    Text(subtitle)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                        .lineLimit(2)
                }
            }
            .padding(16)
        }
        .padding(.bottom, 4)
    }
}
