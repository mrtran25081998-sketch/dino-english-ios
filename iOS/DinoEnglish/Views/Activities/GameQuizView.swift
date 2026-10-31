import SwiftUI

/// Hoạt động 3: Trò chơi đố vui tương tác 3D chọn đúng nghĩa từ vựng
public struct GameQuizView: View {
    @EnvironmentObject var model: LearningViewModel
    @Environment(\.dismiss) private var dismiss
    
    public let lesson: DinoLesson
    @State private var questions: [QuizQuestion] = []
    @State private var roundIndex: Int = 0
    @State private var selectedOptionId: String? = nil
    @State private var score: Int = 0
    @State private var showCelebration: Bool = false
    
    public init(lesson: DinoLesson) {
        self.lesson = lesson
    }
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            if questions.isEmpty {
                VStack(spacing: 12) {
                    ProgressView()
                    Text("Đang chuẩn bị trò chơi...")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                }
            } else {
                let currentQuestion = questions[min(roundIndex, questions.count - 1)]
                let isAnswered = selectedOptionId != nil
                let isCorrect = selectedOptionId == currentQuestion.targetWord.id
                
                VStack(spacing: 14) {
                    // Thanh tiến độ câu hỏi
                    VStack(spacing: 6) {
                        HStack {
                            Text("Câu \(roundIndex + 1) / \(questions.count)")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundStyle(DinoStyle.purple)
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Text("Điểm:")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundStyle(DinoStyle.textMuted)
                                Text("\(score) ⭐")
                                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                                    .foregroundStyle(Color(red: 0.65, green: 0.42, blue: 0.02))
                            }
                        }
                        
                        ProgressView(value: Double(roundIndex + 1), total: Double(questions.count))
                            .tint(DinoStyle.purple)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    
                    // Thẻ câu hỏi nổi bật
                    Dino3DCard {
                        VStack(spacing: 10) {
                            Text("Bé hãy chọn đúng nghĩa của từ:")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                .foregroundStyle(DinoStyle.textMuted)
                            
                            HStack(spacing: 10) {
                                Text(currentQuestion.targetWord.english)
                                    .font(.system(size: 36, weight: .black, design: .rounded))
                                    .foregroundStyle(DinoStyle.purple)
                                
                                Button {
                                    AudioService.shared.speak(currentQuestion.targetWord.english)
                                } label: {
                                    Image(systemName: "speaker.wave.2.fill")
                                        .font(.system(size: 24))
                                        .foregroundStyle(DinoStyle.purple)
                                        .padding(8)
                                        .background(DinoStyle.purple.opacity(0.12), in: Circle())
                                }
                            }
                            
                            Text(currentQuestion.targetWord.ipa)
                                .font(.system(size: 16, weight: .semibold, design: .monospaced))
                                .foregroundStyle(DinoStyle.coral)
                        }
                        .padding(.vertical, 6)
                    }
                    .padding(.horizontal, 20)
                    
                    // Lưới 4 đáp án lựa chọn
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 12) {
                        ForEach(currentQuestion.options) { option in
                            Button {
                                guard selectedOptionId == nil else { return }
                                selectedOptionId = option.id
                                if option.id == currentQuestion.targetWord.id {
                                    score += 2
                                    AudioService.shared.speak("Great job!")
                                } else {
                                    AudioService.shared.speak("Try again!")
                                }
                            } label: {
                                QuizOptionCard(
                                    option: option,
                                    isSelected: selectedOptionId == option.id,
                                    isTarget: option.id == currentQuestion.targetWord.id,
                                    isAnswered: isAnswered
                                )
                            }
                            .buttonStyle(.plain)
                            .disabled(isAnswered)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Linh vật 3D phản hồi theo trạng thái: think khi suy nghĩ, clap khi đúng
                    HStack {
                        Spacer()
                        DinoMascotView(isAnswered ? (isCorrect ? .clap : .reward) : .think, height: 110)
                        Spacer()
                    }
                    
                    // Phản hồi và nút tiếp theo
                    if isAnswered {
                        VStack(spacing: 10) {
                            Text(isCorrect ? "🎉 Tuyệt vời! Bé chọn hoàn toàn chính xác!" : "💛 Chưa đúng rồi, đáp án là \"\(currentQuestion.targetWord.vietnamese)\" nhé!")
                                .font(.system(size: 15, weight: .heavy, design: .rounded))
                                .foregroundStyle(isCorrect ? DinoStyle.green : DinoStyle.coral)
                                .multilineTextAlignment(.center)
                            
                            Dino3DButton(
                                roundIndex == questions.count - 1 ? "Xem Kết Quả Trò Chơi 🏆" : "Câu Tiếp Theo ➔",
                                color: DinoStyle.purple,
                                shadowColor: DinoStyle.purpleDark,
                                textColor: .white
                            ) {
                                if roundIndex < questions.count - 1 {
                                    withAnimation(.spring()) {
                                        roundIndex += 1
                                        selectedOptionId = nil
                                    }
                                    AudioService.shared.speak(questions[roundIndex].targetWord.english)
                                } else {
                                    // Thưởng sao tối đa 10 sao
                                    let earnedStars = max(score, 5)
                                    model.rewardActivity(topicId: lesson.topicId, lessonId: lesson.lessonId, activityType: "game", points: earnedStars)
                                    showCelebration = true
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Spacer(minLength: 16)
                }
            }
        }
        .navigationTitle("Trò chơi 3D")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            setupGame()
        }
        .sheet(isPresented: $showCelebration) {
            RewardCelebrationView(
                title: "Thắng Trò Chơi Xuất Sắc!",
                subtitle: "Bé đạt \(score) điểm trong bài \(lesson.lessonId): \(lesson.title)",
                points: max(score, 5),
                mascot: .reward
            ) {
                showCelebration = false
                dismiss()
            }
        }
    }
    
    private func setupGame() {
        questions = DinoContentRepository.shared.generateQuizQuestions(for: lesson, count: 5)
        roundIndex = 0
        score = 0
        selectedOptionId = nil
        if let first = questions.first {
            AudioService.shared.speak(first.targetWord.english)
        }
    }
}

/// Thẻ một lựa chọn đáp án trắc nghiệm
private struct QuizOptionCard: View {
    let option: VocabularyWord
    let isSelected: Bool
    let isTarget: Bool
    let isAnswered: Bool
    
    var body: some View {
        ZStack {
            let bgColor: Color = {
                if !isAnswered {
                    return Color.white
                }
                if isTarget {
                    return DinoStyle.greenLight
                }
                if isSelected && !isTarget {
                    return Color.red.opacity(0.12)
                }
                return Color.white.opacity(0.7)
            }()
            
            let borderColor: Color = {
                if !isAnswered {
                    return DinoStyle.purple.opacity(0.3)
                }
                if isTarget {
                    return DinoStyle.green
                }
                if isSelected && !isTarget {
                    return Color.red
                }
                return Color.clear
            }()
            
            RoundedRectangle(cornerRadius: 18)
                .fill(bgColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(borderColor, lineWidth: 2.5)
                )
                .shadow(color: Color.black.opacity(0.04), radius: 6, y: 3)
            
            VStack(spacing: 8) {
                Image(systemName: option.symbolName)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(isAnswered && isTarget ? DinoStyle.green : DinoStyle.purple)
                
                Text(option.vietnamese)
                    .font(.system(size: 16, weight: .heavy, design: .rounded))
                    .foregroundStyle(DinoStyle.textDark)
                    .multilineTextAlignment(.center)
            }
            .padding(14)
        }
        .frame(height: 105)
    }
}
