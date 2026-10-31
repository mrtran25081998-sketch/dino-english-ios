import SwiftUI

/// Hoạt động 4: Hát ca vui vẻ cùng Dino với lời bài hát tiếng Anh theo chủ đề
public struct SongPlayerView: View {
    @EnvironmentObject var model: LearningViewModel
    @Environment(\.dismiss) private var dismiss
    
    public let song: DinoSong
    @State private var currentLineIndex: Int = 0
    @State private var showCelebration: Bool = false
    
    public init(song: DinoSong) {
        self.song = song
    }
    
    public var body: some View {
        let lineCount = song.lines.count
        let currentLine = song.lines[min(currentLineIndex, max(lineCount - 1, 0))]
        let currentLineVi = currentLineIndex < song.linesVi.count ? song.linesVi[currentLineIndex] : ""
        
        ZStack {
            DinoBackground()
            
            VStack(spacing: 16) {
                // Tiến độ bài hát
                VStack(spacing: 6) {
                    HStack {
                        Text("Câu \(currentLineIndex + 1) / \(lineCount)")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundStyle(DinoStyle.coral)
                        
                        Spacer()
                        
                        Text(song.title)
                            .font(.system(size: 15, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.coral)
                    }
                    
                    ProgressView(value: Double(currentLineIndex + 1), total: Double(lineCount))
                        .tint(DinoStyle.coral)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                
                Spacer(minLength: 10)
                
                // Linh vật Dino 3D hát ca vui nhộn
                DinoMascotView(.song, height: 180)
                
                // Thẻ câu hát 3D
                Dino3DCard {
                    VStack(spacing: 16) {
                        Image(systemName: "music.note")
                            .font(.system(size: 36))
                            .foregroundStyle(DinoStyle.coral)
                        
                        Text(currentLine)
                            .font(.system(size: 26, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.coral)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 8)
                        
                        if !currentLineVi.isEmpty {
                            Text(currentLineVi)
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                                .multilineTextAlignment(.center)
                        }
                        
                        // Nút nghe câu hát
                        Button {
                            AudioService.shared.speak(currentLine)
                        } label: {
                            Label("Nghe Câu Hát", systemImage: "play.circle.fill")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 22)
                                .padding(.vertical, 11)
                                .background(DinoStyle.coral, in: Capsule())
                        }
                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal, 20)
                
                // Điều khiển bài hát
                HStack(spacing: 12) {
                    if currentLineIndex > 0 {
                        Button {
                            withAnimation(.spring()) {
                                currentLineIndex -= 1
                            }
                            AudioService.shared.speak(song.lines[currentLineIndex])
                        } label: {
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(DinoStyle.coral)
                                .frame(width: 52, height: 52)
                                .background(Color.white, in: Circle())
                                .shadow(color: Color.black.opacity(0.08), radius: 4, y: 3)
                        }
                    }
                    
                    Dino3DButton(
                        currentLineIndex == lineCount - 1 ? "Hoàn Thành Hát Ca +5 ⭐" : "Câu Hát Tiếp Theo ➔",
                        color: DinoStyle.coral,
                        shadowColor: DinoStyle.coralDark,
                        textColor: .white
                    ) {
                        if currentLineIndex < lineCount - 1 {
                            withAnimation(.spring()) {
                                currentLineIndex += 1
                            }
                            AudioService.shared.speak(song.lines[currentLineIndex])
                        } else {
                            model.rewardActivity(topicId: song.topicId, lessonId: 1, activityType: "song", points: 5)
                            showCelebration = true
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                // Ghi chú về bản quyền âm nhạc
                Text("Giai điệu học tập: Ứng dụng đọc từng câu hát nhịp điệu tiếng Anh chuẩn giọng bản ngữ.")
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(DinoStyle.textMuted)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer(minLength: 16)
            }
        }
        .navigationTitle(song.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            AudioService.shared.speak(currentLine)
        }
        .sheet(isPresented: $showCelebration) {
            RewardCelebrationView(
                title: "Bé Hát Thật Hay!",
                subtitle: "Đã hoàn thành bài hát: \(song.title)",
                points: 5,
                mascot: .reward
            ) {
                showCelebration = false
                dismiss()
            }
        }
    }
}
