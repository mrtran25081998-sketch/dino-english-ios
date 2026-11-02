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
    
    // Kiểm tra trạng thái hoàn thành từng hoạt động
    private var isVocabDone: Bool {
        model.completedActivityIDs.contains("\(topic.id)_l\(lesson.lessonId)_vocab")
    }
    private var isPronDone: Bool {
        model.completedActivityIDs.contains("\(topic.id)_l\(lesson.lessonId)_pron")
    }
    private var isGameDone: Bool {
        model.completedActivityIDs.contains("\(topic.id)_l\(lesson.lessonId)_game")
    }
    private var isSongDone: Bool {
        model.completedActivityIDs.contains("\(topic.id)_l\(lesson.lessonId)_song") ||
        model.completedActivityIDs.contains("\(topic.id)_song")
    }
    
    private var completedActivitiesCount: Int {
        (isVocabDone ? 1 : 0) + (isPronDone ? 1 : 0) + (isGameDone ? 1 : 0) + (isSongDone ? 1 : 0)
    }
    
    private var progressRatio: Double {
        Double(completedActivitiesCount) / 4.0
    }
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // Header bài học với linh vật 3D và thanh tiến độ
                    Dino3DCard(backgroundColor: topic.themeColor.opacity(0.12)) {
                        VStack(spacing: 12) {
                            HStack(spacing: 16) {
                                DinoMascotView(completedActivitiesCount == 4 ? .level4 : (completedActivitiesCount > 0 ? .study : .welcome), height: 100)
                                
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
                            
                            // Thanh tiến độ 4 hoạt động
                            VStack(spacing: 6) {
                                HStack {
                                    Text("Tiến độ bài học:")
                                        .font(.system(size: 13, weight: .heavy, design: .rounded))
                                        .foregroundStyle(DinoStyle.textDark)
                                    Spacer()
                                    Text("\(completedActivitiesCount)/4 phần (\(Int(progressRatio * 100))%) \(completedActivitiesCount == 4 ? "🎉" : "")")
                                        .font(.system(size: 13, weight: .black, design: .rounded))
                                        .foregroundStyle(completedActivitiesCount == 4 ? DinoStyle.green : topic.themeColor)
                                }
                                
                                GeometryReader { geo in
                                    ZStack(alignment: .leading) {
                                        Capsule()
                                            .fill(Color(red: 0.88, green: 0.93, blue: 0.89))
                                            .frame(height: 10)
                                        
                                        Capsule()
                                            .fill(LinearGradient(
                                                colors: [Color(red: 0.2, green: 0.83, blue: 0.6), Color(red: 0.06, green: 0.72, blue: 0.51)],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ))
                                            .frame(width: max(geo.size.width * progressRatio, 0), height: 10)
                                            .animation(.spring(response: 0.4), value: progressRatio)
                                    }
                                }
                                .frame(height: 10)
                            }
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
                            starsReward: "+5 ⭐",
                            isCompleted: isVocabDone
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
                            starsReward: "+5 ⭐",
                            isCompleted: isPronDone
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
                            starsReward: "+10 ⭐",
                            isCompleted: isGameDone
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
                                starsReward: "+5 ⭐",
                                isCompleted: isSongDone
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
        .toolbar(.hidden, for: .tabBar)
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
    var isCompleted: Bool = false
    
    var body: some View {
        ZStack {
            // Đáy đổ bóng 3D
            RoundedRectangle(cornerRadius: 22)
                .fill((isCompleted ? DinoStyle.green : color).opacity(0.35))
                .offset(y: 4)
            
            // Mặt chính
            RoundedRectangle(cornerRadius: 22)
                .fill(isCompleted ? Color(red: 0.96, green: 0.99, blue: 0.97) : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(isCompleted ? DinoStyle.green : color.opacity(0.35), lineWidth: 2)
                )
            
            HStack(spacing: 14) {
                // Biểu tượng tròn
                ZStack {
                    Circle()
                        .fill((isCompleted ? DinoStyle.green : color).opacity(0.18))
                        .frame(width: 54, height: 54)
                    
                    Image(systemName: icon)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(isCompleted ? DinoStyle.green : color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(title)
                            .font(.system(size: 16, weight: .heavy, design: .rounded))
                            .foregroundStyle(isCompleted ? DinoStyle.green : color)
                        
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
                
                // Dấu tích xanh tròn bên phải
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(DinoStyle.green)
                        .shadow(color: DinoStyle.green.opacity(0.3), radius: 4, y: 2)
                } else {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(DinoStyle.textMuted.opacity(0.5))
                }
            }
            .padding(16)
        }
        .padding(.bottom, 4)
    }
}
