import SwiftUI

/// Màn hình chính Dashboard của bé với linh vật 3D Dino
public struct HomeView: View {
    @EnvironmentObject var model: LearningViewModel
    
    public init() {}
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    // Header chào bé & linh vật 3D
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Xin chào ngày mới,")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                            
                            Text("\(model.childName)! 👋")
                                .font(.system(size: 32, weight: .black, design: .rounded))
                                .foregroundStyle(DinoStyle.green)
                            
                            HStack(spacing: 12) {
                                // Huy hiệu sao
                                HStack(spacing: 5) {
                                    Text("⭐")
                                        .font(.system(size: 15))
                                    Text("\(model.stars)")
                                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                                        .foregroundStyle(Color(red: 0.65, green: 0.42, blue: 0.02))
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(DinoStyle.yellowLight.opacity(0.6), in: Capsule())
                                
                                // Chuỗi ngày học
                                HStack(spacing: 4) {
                                    Text("🔥")
                                        .font(.system(size: 15))
                                    Text("\(model.dailyStreak) ngày")
                                        .font(.system(size: 14, weight: .bold, design: .rounded))
                                        .foregroundStyle(Color.orange)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.orange.opacity(0.15), in: Capsule())
                            }
                            .padding(.top, 4)
                        }
                        
                        Spacer()
                        
                        // Linh vật Dino 3D trang chủ
                        DinoMascotView(.home, height: 125)
                    }
                    .padding(.horizontal, 4)
                    
                    // Thẻ "Tiếp tục bài học" nổi bật
                    if let topic = model.currentSelectedTopic, let lesson = model.currentSelectedLesson {
                        NavigationLink(destination: ActivityHubView(topic: topic, lesson: lesson)) {
                            Dino3DCard(backgroundColor: Color(red: 0.92, green: 0.99, blue: 0.91)) {
                                HStack(spacing: 14) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("TIẾP TỤC HÀNH TRÌNH")
                                            .font(.system(size: 11, weight: .black, design: .rounded))
                                            .foregroundStyle(DinoStyle.green)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 3)
                                            .background(DinoStyle.green.opacity(0.15), in: Capsule())
                                        
                                        Text("\(topic.nameVi): Bài \(lesson.lessonId)")
                                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                                            .foregroundStyle(DinoStyle.textDark)
                                        
                                        Text(lesson.title)
                                            .font(.system(size: 14, weight: .medium, design: .rounded))
                                            .foregroundStyle(DinoStyle.textMuted)
                                        
                                        HStack(spacing: 6) {
                                            Text("Học ngay")
                                                .font(.system(size: 15, weight: .heavy, design: .rounded))
                                                .foregroundStyle(DinoStyle.yellowDark)
                                            Image(systemName: "play.circle.fill")
                                                .foregroundStyle(DinoStyle.yellow)
                                        }
                                        .padding(.top, 4)
                                    }
                                    
                                    Spacer()
                                    
                                    DinoMascotView(.study, height: 110)
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    
                    // 4 Hoạt động học tập chính
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Bé muốn học gì hôm nay?")
                            .font(.system(size: 19, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.textDark)
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 12) {
                            if let topic = model.currentSelectedTopic, let lesson = model.currentSelectedLesson {
                                ActivityTile(
                                    title: "Từ vựng",
                                    subtitle: "10 Thẻ học 3D",
                                    icon: "character.book.closed.fill",
                                    color: DinoStyle.green,
                                    mascot: .study,
                                    destination: AnyView(VocabularyFlashcardView(lesson: lesson))
                                )
                                
                                ActivityTile(
                                    title: "Phát âm",
                                    subtitle: "Luyện nói chuẩn",
                                    icon: "mic.fill",
                                    color: DinoStyle.blue,
                                    mascot: .speak,
                                    destination: AnyView(PronunciationPracticeView(lesson: lesson))
                                )
                                
                                ActivityTile(
                                    title: "Trò chơi",
                                    subtitle: "Chọn đúng hình",
                                    icon: "gamecontroller.fill",
                                    color: DinoStyle.purple,
                                    mascot: .game,
                                    destination: AnyView(GameQuizView(lesson: lesson))
                                )
                                
                                ActivityTile(
                                    title: "Bài hát",
                                    subtitle: "Giai điệu vui",
                                    icon: "music.note.list",
                                    color: DinoStyle.coral,
                                    mascot: .song,
                                    destination: AnyView(SongPlayerView(song: topic.song ?? DinoSong(topicId: topic.id, title: "English Song", lines: ["Hello friends!"], linesVi: ["Xin chào các bạn!"])))
                                )
                            }
                        }
                    }
                    
                    // Cột mốc Dino trưởng thành
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Dino lớn lên cùng bé")
                            .font(.system(size: 19, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.textDark)
                        
                        NavigationLink(destination: DinoGrowthView()) {
                            Dino3DCard(backgroundColor: Color.white) {
                                HStack(spacing: 16) {
                                    DinoMascotView(model.currentMascot, height: 95)
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        HStack {
                                            Text("Cấp độ \(model.currentMilestone.level)")
                                                .font(.system(size: 12, weight: .black, design: .rounded))
                                                .foregroundStyle(.white)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 3)
                                                .background(DinoStyle.green, in: Capsule())
                                            
                                            Text(model.currentMilestone.stageName)
                                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                                .foregroundStyle(DinoStyle.textMuted)
                                        }
                                        
                                        Text(model.currentMilestone.title)
                                            .font(.system(size: 16, weight: .heavy, design: .rounded))
                                            .foregroundStyle(DinoStyle.textDark)
                                        
                                        // Thanh tiến độ
                                        ProgressView(value: model.evolutionProgress)
                                            .tint(DinoStyle.green)
                                        
                                        HStack {
                                            Text("\(model.completedLessonsCount) bài đã hoàn thành")
                                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                                .foregroundStyle(DinoStyle.textMuted)
                                            Spacer()
                                            Text("Hành trình ➔")
                                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                                .foregroundStyle(DinoStyle.green)
                                        }
                                    }
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal, 18)
                .padding(.top, 10)
            }
        }
        .navigationTitle("Trang chủ")
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// Thẻ chức năng 4 hoạt động chính
private struct ActivityTile: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let mascot: DinoMascot
    let destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 22)
                    .fill(color.opacity(0.12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(color.opacity(0.35), lineWidth: 2)
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: icon)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(color)
                        Spacer()
                    }
                    
                    Spacer(minLength: 0)
                    
                    Text(title)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                        .foregroundStyle(color)
                    
                    Text(subtitle)
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                }
                .padding(14)
            }
            .frame(height: 115)
        }
        .buttonStyle(.plain)
    }
}
