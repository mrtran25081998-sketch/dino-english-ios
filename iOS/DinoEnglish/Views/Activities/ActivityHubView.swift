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
                    
                    // 1. TỪ VỰNG
                    NavigationLink(destination: VocabularyFlashcardView(lesson: lesson)) {
                        HubActionCard(
                            title: "Từ vựng",
                            subtitle: "10 thẻ học",
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
                            title: "Phát âm",
                            subtitle: "Luyện nói chuẩn",
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
                            title: "Trò chơi",
                            subtitle: "Đố vui 3D",
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
                                title: "Bài hát",
                                subtitle: "Giai điệu vui",
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
            RoundedRectangle(cornerRadius: 20)
                .fill((isCompleted ? DinoStyle.green : Color(red: 0.75, green: 0.88, blue: 0.79)).opacity(0.4))
                .offset(y: 4)
            
            // Mặt chính
            RoundedRectangle(cornerRadius: 20)
                .fill(isCompleted ? Color(red: 0.96, green: 0.99, blue: 0.97) : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isCompleted ? DinoStyle.green.opacity(0.6) : Color(red: 0.88, green: 0.94, blue: 0.9), lineWidth: 2)
                )
            
            HStack(spacing: 12) {
                // Biểu tượng squircle 3D
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color.opacity(0.16))
                        .frame(width: 48, height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(color.opacity(0.25), lineWidth: 1.5)
                        )
                    
                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundStyle(color)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 16, weight: .black, design: .rounded))
                        .foregroundStyle(DinoStyle.textDark)
                    
                    HStack(spacing: 6) {
                        Text(starsReward)
                            .font(.system(size: 11, weight: .heavy, design: .rounded))
                            .foregroundStyle(Color(red: 0.65, green: 0.42, blue: 0.02))
                            .padding(.horizontal, 7)
                            .padding(.vertical, 2)
                            .background(DinoStyle.yellowLight.opacity(0.8), in: Capsule())
                        
                        Text(subtitle)
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundStyle(DinoStyle.textMuted)
                    }
                }
                
                Spacer()
                
                // Dấu tích hoặc mũi tên
                if isCompleted {
                    ZStack {
                        Circle()
                            .fill(LinearGradient(
                                colors: [Color(red: 0.2, green: 0.83, blue: 0.6), Color(red: 0.06, green: 0.72, blue: 0.51)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 36, height: 36)
                        
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .black))
                            .foregroundStyle(.white)
                    }
                    .shadow(color: DinoStyle.green.opacity(0.35), radius: 4, y: 2)
                } else {
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.94, green: 0.96, blue: 0.95))
                            .frame(width: 36, height: 36)
                        
                        Image(systemName: "arrow.right")
                            .font(.system(size: 13, weight: .heavy))
                            .foregroundStyle(Color(red: 0.4, green: 0.5, blue: 0.45))
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
        }
        .padding(.bottom, 4)
    }
}
