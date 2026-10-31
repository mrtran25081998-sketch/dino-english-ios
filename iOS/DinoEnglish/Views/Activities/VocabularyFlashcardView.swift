import SwiftUI

/// Hoạt động 1: Học từ vựng qua 10 thẻ Flashcard tương tác 3D
public struct VocabularyFlashcardView: View {
    @EnvironmentObject var model: LearningViewModel
    @Environment(\.dismiss) private var dismiss
    
    public let lesson: DinoLesson
    @State private var currentIndex: Int = 0
    @State private var isFlipped: Bool = false
    @State private var showCelebration: Bool = false
    
    public init(lesson: DinoLesson) {
        self.lesson = lesson
    }
    
    public var body: some View {
        let words = lesson.words
        let word = words[min(currentIndex, max(words.count - 1, 0))]
        
        ZStack {
            DinoBackground()
            
            VStack(spacing: 16) {
                // Thanh tiến độ bài học
                VStack(spacing: 6) {
                    HStack {
                        Text("Từ \(currentIndex + 1) / \(words.count)")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundStyle(DinoStyle.textMuted)
                        
                        Spacer()
                        
                        Text(lesson.title)
                            .font(.system(size: 14, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.green)
                    }
                    
                    ProgressView(value: Double(currentIndex + 1), total: Double(words.count))
                        .tint(DinoStyle.green)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                
                Spacer(minLength: 10)
                
                // Thẻ flashcard 3D chính
                Dino3DCard {
                    VStack(spacing: 18) {
                        // Huy hiệu hình ảnh biểu trưng
                        ZStack {
                            Circle()
                                .fill(DinoStyle.green.opacity(0.12))
                                .frame(width: 110, height: 110)
                            
                            if let emoji = word.emoji, !emoji.isEmpty {
                                Text(emoji)
                                    .font(.system(size: 58))
                            } else {
                                Image(systemName: word.symbolName)
                                    .font(.system(size: 55, weight: .bold))
                                    .foregroundStyle(DinoStyle.green)
                            }
                        }
                        .padding(.top, 10)
                        
                        // Từ tiếng Anh
                        Text(word.english)
                            .font(.system(size: 38, weight: .black, design: .rounded))
                            .foregroundStyle(DinoStyle.green)
                            .multilineTextAlignment(.center)
                        
                        // Phiên âm quốc tế IPA chuẩn
                        Text(word.ipa)
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            .foregroundStyle(DinoStyle.coral)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 5)
                            .background(DinoStyle.coral.opacity(0.12), in: Capsule())
                        
                        // Nghĩa tiếng Việt
                        Text(word.vietnamese)
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                            .foregroundStyle(DinoStyle.textDark)
                        
                        // Câu ví dụ trực quan
                        VStack(spacing: 4) {
                            Text(word.example)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundStyle(DinoStyle.textDark)
                                .multilineTextAlignment(.center)
                            
                            Text(word.exampleVi)
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                                .multilineTextAlignment(.center)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(DinoStyle.cream, in: RoundedRectangle(cornerRadius: 16))
                        
                        // Nút nghe phát âm AVSpeechSynthesizer
                        Button {
                            AudioService.shared.speak(word.english)
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: "speaker.wave.3.fill")
                                Text("Nghe Phát Âm")
                            }
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(DinoStyle.green, in: Capsule())
                            .shadow(color: DinoStyle.green.opacity(0.3), radius: 4, y: 3)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .padding(.horizontal, 20)
                
                // Linh vật 3D Dino đọc sách
                HStack {
                    Spacer()
                    DinoMascotView(.study, height: 110)
                    Spacer()
                }
                
                // Nút chuyển thẻ tiếp theo / hoàn thành
                HStack(spacing: 12) {
                    if currentIndex > 0 {
                        Button {
                            withAnimation(.spring()) {
                                currentIndex -= 1
                            }
                        } label: {
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(DinoStyle.green)
                                .frame(width: 56, height: 56)
                                .background(Color.white, in: Circle())
                                .shadow(color: Color.black.opacity(0.08), radius: 4, y: 3)
                        }
                    }
                    
                    Dino3DButton(
                        currentIndex == words.count - 1 ? "Hoàn Thành +5 ⭐" : "Từ Tiếp Theo ➔",
                        color: DinoStyle.yellow,
                        shadowColor: DinoStyle.yellowDark
                    ) {
                        if currentIndex < words.count - 1 {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                                currentIndex += 1
                            }
                            // Tự động phát âm từ tiếp theo cho bé nghe
                            AudioService.shared.speak(words[currentIndex].english)
                        } else {
                            // Nhận thưởng và mở màn hình ăn mừng
                            model.rewardActivity(topicId: lesson.topicId, lessonId: lesson.lessonId, activityType: "vocab", points: 5)
                            showCelebration = true
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 16)
            }
        }
        .navigationTitle("Từ vựng 3D")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            AudioService.shared.speak(word.english)
        }
        .sheet(isPresented: $showCelebration) {
            RewardCelebrationView(
                title: "Hoàn Thành 10 Từ Vựng!",
                subtitle: "Bé đã học xong bài \(lesson.lessonId): \(lesson.title)",
                points: 5,
                mascot: .reward
            ) {
                showCelebration = false
                dismiss()
            }
        }
    }
}
