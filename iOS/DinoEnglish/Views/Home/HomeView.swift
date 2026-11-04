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
                    // 1. Header trên cùng: Avatar bé, Lời chào, Nút Quà tặng & Cài đặt
                    HStack(alignment: .center) {
                        HStack(spacing: 12) {
                            // Avatar tròn của bé với huy hiệu sao
                            ZStack(alignment: .bottomTrailing) {
                                Circle()
                                    .fill(LinearGradient(colors: [Color(red: 0.86, green: 0.98, blue: 0.89), Color(red: 0.73, green: 0.97, blue: 0.82)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: 52, height: 52)
                                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                    .shadow(color: Color.black.opacity(0.08), radius: 6, y: 3)
                                    .overlay(
                                        DinoMascotView(.welcome, height: 46)
                                            .clipShape(Circle())
                                    )
                                
                                Text("⭐")
                                    .font(.system(size: 10))
                                    .frame(width: 18, height: 18)
                                    .background(Color(red: 1.0, green: 0.82, blue: 0.2))
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .offset(x: 2, y: 2)
                            }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Xin chào,")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .foregroundStyle(Color(red: 0.25, green: 0.42, blue: 0.32))
                                
                                Text("\(model.childName)!")
                                    .font(.system(size: 22, weight: .black, design: .rounded))
                                    .foregroundStyle(DinoStyle.green)
                            }
                        }
                        
                        Spacer()
                        
                        // Nút Quà tặng 🎁 & Cài đặt ⚙️
                        HStack(spacing: 8) {
                            Button {
                                model.stars += 5
                                model.showRewardCelebration = true
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 40, height: 40)
                                        .shadow(color: Color.black.opacity(0.06), radius: 4, y: 2)
                                        .overlay(Circle().stroke(Color(red: 0.9, green: 0.95, blue: 0.92), lineWidth: 1.5))
                                    
                                    Text("🎁")
                                        .font(.system(size: 19))
                                }
                            }
                            .buttonStyle(.plain)
                            
                            NavigationLink(destination: DinoGrowthView()) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 40, height: 40)
                                        .shadow(color: Color.black.opacity(0.06), radius: 4, y: 2)
                                        .overlay(Circle().stroke(Color(red: 0.9, green: 0.95, blue: 0.92), lineWidth: 1.5))
                                    
                                    Image(systemName: "gearshape.fill")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(Color(red: 0.1, green: 0.48, blue: 0.95))
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 4)
                    .padding(.top, 24)
                    
                    // 2. Khung thống kê học tập (Chuỗi ngày - Hôm nay - Sao) chuẩn theo thiết kế
                    HStack(spacing: 10) {
                        // Cột 1: Chuỗi ngày học
                        HStack(spacing: 6) {
                            Text("🔥")
                                .font(.system(size: 24))
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Chuỗi ngày học")
                                    .font(.system(size: 10, weight: .bold, design: .rounded))
                                    .foregroundStyle(Color(red: 1.0, green: 0.34, blue: 0.13))
                                
                                HStack(alignment: .lastTextBaseline, spacing: 3) {
                                    Text("\(model.dailyStreak)")
                                        .font(.system(size: 18, weight: .black, design: .rounded))
                                        .foregroundStyle(Color(red: 0.9, green: 0.29, blue: 0.1))
                                    Text("ngày liên tiếp")
                                        .font(.system(size: 10, weight: .medium, design: .rounded))
                                        .foregroundStyle(Color(red: 0.45, green: 0.55, blue: 0.48))
                                }
                            }
                        }
                        
                        // Đường ngăn cách
                        Rectangle()
                            .fill(Color(red: 0.91, green: 0.94, blue: 0.92))
                            .frame(width: 1, height: 32)
                        
                        // Cột 2: Hôm nay 3/5 bài (5 vạch bo góc)
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 4) {
                                Text("Hôm nay:")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .foregroundStyle(Color(red: 0.2, green: 0.35, blue: 0.25))
                                Text("3/5 bài")
                                    .font(.system(size: 11, weight: .black, design: .rounded))
                                    .foregroundStyle(DinoStyle.green)
                            }
                            
                            HStack(spacing: 3) {
                                ForEach(0..<5) { index in
                                    Capsule()
                                        .fill(index < 3 ? DinoStyle.green : Color(red: 0.88, green: 0.93, blue: 0.9))
                                        .frame(height: 7)
                                }
                            }
                        }
                        
                        // Đường ngăn cách
                        Rectangle()
                            .fill(Color(red: 0.91, green: 0.94, blue: 0.92))
                            .frame(width: 1, height: 32)
                        
                        // Cột 3: Sao tích lũy
                        VStack(spacing: 2) {
                            Text("⭐")
                                .font(.system(size: 18))
                            Text("\(model.stars)")
                                .font(.system(size: 13, weight: .black, design: .rounded))
                                .foregroundStyle(Color(red: 0.55, green: 0.35, blue: 0.02))
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(red: 1.0, green: 0.97, blue: 0.88), in: RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(Color.white.opacity(0.96), in: RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 1.5))
                    .shadow(color: Color.black.opacity(0.06), radius: 8, y: 3)
                    
                    // 3. Thẻ "Tiếp tục bài học" nổi bật với ảnh nền phong cảnh đồng cỏ 3D
                    if let topic = model.currentSelectedTopic, let lesson = model.currentSelectedLesson {
                        NavigationLink(destination: ActivityHubView(topic: topic, lesson: lesson)) {
                            ZStack {
                                Image("banner_hoc_ngay")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 165)
                                    .clipped()
                                
                                HStack(spacing: 12) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        HStack(spacing: 6) {
                                            Text("Tiếp tục học")
                                                .font(.system(size: 11, weight: .black, design: .rounded))
                                                .foregroundStyle(Color.white)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 3)
                                                .background(DinoStyle.green, in: Capsule())
                                            
                                            Text("⭐ Bài \(lesson.lessonId)/8")
                                                .font(.system(size: 11, weight: .black, design: .rounded))
                                                .foregroundStyle(Color.white)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 3)
                                                .background(Color(red: 0.55, green: 0.36, blue: 0.96), in: Capsule())
                                        }
                                        
                                        Text("\(topic.nameVi): Bài \(lesson.lessonId)")
                                            .font(.system(size: 19, weight: .heavy, design: .rounded))
                                            .foregroundStyle(Color(red: 0.08, green: 0.32, blue: 0.15))
                                        
                                        Text(lesson.title)
                                            .font(.system(size: 13, weight: .bold, design: .rounded))
                                            .foregroundStyle(Color(red: 0.14, green: 0.38, blue: 0.22))
                                        
                                        HStack(spacing: 6) {
                                            Text("Học ngay")
                                                .font(.system(size: 15, weight: .heavy, design: .rounded))
                                                .foregroundStyle(Color.white)
                                            Image(systemName: "play.circle.fill")
                                                .foregroundStyle(Color.white)
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 7)
                                        .background(
                                            LinearGradient(
                                                colors: [Color(red: 1.0, green: 0.72, blue: 0.15), Color(red: 0.98, green: 0.55, blue: 0.05)],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            ),
                                            in: Capsule()
                                        )
                                        .shadow(color: Color.orange.opacity(0.35), radius: 5, y: 2)
                                        .padding(.top, 4)
                                    }
                                    
                                    DinoMascotView(.welcome, height: 145)
                                        .offset(y: 4)
                                }
                                .padding(16)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color(red: 0.52, green: 0.85, blue: 0.6), lineWidth: 2)
                            )
                            .shadow(color: Color.black.opacity(0.08), radius: 8, y: 4)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    // 4 Hoạt động học tập chính xếp thành 1 hàng ngang chuẩn theo yêu cầu
                    if let topic = model.currentSelectedTopic, let lesson = model.currentSelectedLesson {
                        HStack(spacing: 8) {
                            ActivityTile(
                                title: "Từ vựng",
                                icon: "book.fill",
                                color: DinoStyle.green,
                                destination: AnyView(VocabularyFlashcardView(lesson: lesson))
                            )
                            
                            ActivityTile(
                                title: "Phát âm",
                                icon: "mic.fill",
                                color: DinoStyle.blue,
                                destination: AnyView(PronunciationPracticeView(lesson: lesson))
                            )
                            
                            ActivityTile(
                                title: "Trò chơi",
                                icon: "gamecontroller.fill",
                                color: DinoStyle.purple,
                                destination: AnyView(GameQuizView(lesson: lesson))
                            )
                            
                            ActivityTile(
                                title: "Bài hát",
                                icon: "music.note",
                                color: DinoStyle.coral,
                                destination: AnyView(SongPlayerView(song: topic.song ?? DinoSong(topicId: topic.id, title: "English Song", lines: ["Hello friends!"], linesVi: ["Xin chào các bạn!"])))
                            )
                        }
                    }
                    
                    // Cột mốc Dino trưởng thành (đã bỏ 2 phần tiêu đề)
                        
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

/// Thẻ chức năng 4 hoạt động chính xếp 1 hàng ngang
private struct ActivityTile: View {
    let title: String
    let icon: String
    let color: Color
    let destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: 6) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(color.opacity(0.12))
                        .frame(width: 44, height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(color.opacity(0.35), lineWidth: 1.5)
                        )
                    
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(color)
                }
                
                Text(title)
                    .font(.system(size: 12, weight: .heavy, design: .rounded))
                    .foregroundStyle(color)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.92), in: RoundedRectangle(cornerRadius: 18))
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.white, lineWidth: 1.5)
            )
            .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
        }
        .buttonStyle(.plain)
    }
}
