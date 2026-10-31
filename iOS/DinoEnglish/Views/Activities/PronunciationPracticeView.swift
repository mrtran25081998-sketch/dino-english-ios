import SwiftUI

/// Hoạt động 2: Luyện phát âm nghe và nhắc lại cùng Dino 3D
public struct PronunciationPracticeView: View {
    @EnvironmentObject var model: LearningViewModel
    @Environment(\.dismiss) private var dismiss
    @StateObject private var speechService = SpeechRecognitionService()
    
    public let lesson: DinoLesson
    @State private var targetIndex: Int = 0
    @State private var showCelebration: Bool = false
    @State private var hasPassedCurrent: Bool = false
    
    public init(lesson: DinoLesson) {
        self.lesson = lesson
    }
    
    public var body: some View {
        let words = lesson.words
        let targetWord = words[min(targetIndex, max(words.count - 1, 0))]
        let isMatched = speechService.checkMatch(with: targetWord.english)
        
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // Tiến độ
                    VStack(spacing: 6) {
                        HStack {
                            Text("Từ \(targetIndex + 1) / \(words.count)")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                            
                            Spacer()
                            
                            Text("Phát Âm Cùng Dino")
                                .font(.system(size: 14, weight: .heavy, design: .rounded))
                                .foregroundStyle(DinoStyle.blue)
                        }
                        
                        ProgressView(value: Double(targetIndex + 1), total: Double(words.count))
                            .tint(DinoStyle.blue)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    
                    // Linh vật 3D thay đổi theo trạng thái nói / nghe
                    DinoMascotView(speechService.isListening ? .speak : .listen, height: 160)
                    
                    // Thẻ luyện phát âm
                    Dino3DCard {
                        VStack(spacing: 14) {
                            if let emoji = targetWord.emoji, !emoji.isEmpty {
                                Text(emoji)
                                    .font(.system(size: 48))
                            }
                            
                            Text(targetWord.english)
                                .font(.system(size: 40, weight: .black, design: .rounded))
                                .foregroundStyle(DinoStyle.blue)
                            
                            Text(targetWord.ipa)
                                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                                .foregroundStyle(DinoStyle.coral)
                            
                            Text(targetWord.vietnamese)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                            
                            // Nút nghe mẫu
                            Button {
                                AudioService.shared.speak(targetWord.english)
                            } label: {
                                Label("Nghe phát âm mẫu", systemImage: "speaker.wave.3.fill")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(DinoStyle.blue, in: Capsule())
                            }
                            
                            Divider().padding(.vertical, 4)
                            
                            // Nút micro tròn lớn
                            Button {
                                speechService.toggleListening(targetWord: targetWord.english)
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(speechService.isListening ? Color.red.opacity(0.18) : DinoStyle.blue.opacity(0.15))
                                        .frame(width: 90, height: 90)
                                        .scaleEffect(speechService.isListening ? 1.15 : 1.0)
                                        .animation(speechService.isListening ? .easeInOut(duration: 0.8).repeatForever(autoreverses: true) : .default, value: speechService.isListening)
                                    
                                    Image(systemName: speechService.isListening ? "stop.circle.fill" : "mic.circle.fill")
                                        .font(.system(size: 75))
                                        .foregroundStyle(speechService.isListening ? Color.red : DinoStyle.blue)
                                }
                            }
                            .accessibilityLabel(speechService.isListening ? "Dừng ghi âm" : "Bắt đầu tập nói")
                            
                            Text(speechService.isListening ? "Đang lắng nghe bé nói..." : "Chạm micro và nói to từ này nhé!")
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundStyle(speechService.isListening ? Color.red : DinoStyle.textDark)
                            
                            // Kết quả bé nói
                            if !speechService.transcript.isEmpty {
                                VStack(spacing: 6) {
                                    Text("Bé đã nói: \"\(speechService.transcript)\"")
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        .foregroundStyle(DinoStyle.textDark)
                                    
                                    if isMatched {
                                        Text("🎉 Xuất sắc! Bé phát âm rất chuẩn!")
                                            .font(.system(size: 16, weight: .heavy, design: .rounded))
                                            .foregroundStyle(DinoStyle.green)
                                    } else {
                                        Text("🌈 Cố lên! Bé hãy nghe lại mẫu rồi thử lại nhé!")
                                            .font(.system(size: 15, weight: .bold, design: .rounded))
                                            .foregroundStyle(DinoStyle.coral)
                                    }
                                }
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(isMatched ? DinoStyle.greenLight : Color.orange.opacity(0.12), in: RoundedRectangle(cornerRadius: 16))
                            }
                            
                            // Nút giả lập (khi chạy trên Simulator không có microphone vật lý)
                            Button("⚡ Thử giả lập phát âm đúng (Simulator)") {
                                speechService.simulateMatch(for: targetWord.english)
                            }
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundStyle(DinoStyle.textMuted)
                            .padding(.top, 4)
                        }
                        .padding(.vertical, 8)
                    }
                    .padding(.horizontal, 20)
                    
                    // Nút chuyển từ tiếp theo
                    Dino3DButton(
                        targetIndex == words.count - 1 ? "Hoàn Thành Luyện Nói +5 ⭐" : "Từ Tiếp Theo ➔",
                        color: DinoStyle.blue,
                        shadowColor: DinoStyle.blueDark,
                        textColor: .white
                    ) {
                        speechService.stopListening()
                        speechService.transcript = ""
                        
                        if targetIndex < words.count - 1 {
                            withAnimation(.spring()) {
                                targetIndex += 1
                            }
                            AudioService.shared.speak(words[targetIndex].english)
                        } else {
                            model.rewardActivity(topicId: lesson.topicId, lessonId: lesson.lessonId, activityType: "pronounce", points: 5)
                            showCelebration = true
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Lưu ý phụ huynh
                    Text("Lưu ý: Ứng dụng nhận diện từ ngữ qua giọng nói, không chấm điểm âm vị nhân tạo.")
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Spacer(minLength: 20)
                }
            }
        }
        .navigationTitle("Luyện phát âm")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            AudioService.shared.speak(targetWord.english)
        }
        .onDisappear {
            speechService.stopListening()
        }
        .alert("Quyền Microphone & Nhận Diện", isPresented: Binding(
            get: { speechService.errorMessage != nil },
            set: { if !$0 { speechService.errorMessage = nil } }
        )) {
            Button("Đã hiểu", role: .cancel) { speechService.errorMessage = nil }
        } message: {
            Text(speechService.errorMessage ?? "")
        }
        .sheet(isPresented: $showCelebration) {
            RewardCelebrationView(
                title: "Bé Phát Âm Thật Tuyệt!",
                subtitle: "Đã hoàn thành luyện nói bài \(lesson.lessonId): \(lesson.title)",
                points: 5,
                mascot: .clap
            ) {
                showCelebration = false
                dismiss()
            }
        }
    }
}
