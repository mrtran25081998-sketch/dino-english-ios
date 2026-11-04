import SwiftUI

/// Màn hình chọn bài học trong một chủ đề (10 bài học x 10 từ = 100 từ)
public struct LessonListView: View {
    @EnvironmentObject var model: LearningViewModel
    public let topic: DinoTopic
    
    public init(topic: DinoTopic) {
        self.topic = topic
    }
    
    public var body: some View {
        ZStack {
            DinoBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    // Danh sách 10 bài học
                    VStack(spacing: 12) {
                        ForEach(topic.lessons) { lesson in
                            let isUnlocked = model.isLessonUnlocked(topicId: topic.id, lessonId: lesson.lessonId)
                            let isCompleted = model.isLessonCompleted(topicId: topic.id, lessonId: lesson.lessonId)
                            
                            if isUnlocked {
                                NavigationLink(destination: ActivityHubView(topic: topic, lesson: lesson)) {
                                    LessonCard(topic: topic, lesson: lesson, isCompleted: isCompleted, isUnlocked: true)
                                }
                                .buttonStyle(.plain)
                            } else {
                                LessonCard(topic: topic, lesson: lesson, isCompleted: false, isUnlocked: false)
                                    .opacity(0.65)
                            }
                        }
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
            }
        }
        .navigationTitle(topic.nameVi)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
}

/// Thẻ bài học
private struct LessonCard: View {
    let topic: DinoTopic
    let lesson: DinoLesson
    let isCompleted: Bool
    let isUnlocked: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(isUnlocked ? (isCompleted ? DinoStyle.greenLight : Color.white) : Color.gray.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isUnlocked ? (isCompleted ? DinoStyle.green : topic.themeColor.opacity(0.35)) : Color.gray.opacity(0.3), lineWidth: 1.8)
                )
                .shadow(color: Color.black.opacity(0.04), radius: 6, y: 3)
            
            HStack(spacing: 14) {
                // Biểu tượng trạng thái / số thứ tự
                ZStack {
                    Circle()
                        .fill(isUnlocked ? (isCompleted ? DinoStyle.green : topic.themeColor) : Color.gray.opacity(0.4))
                        .frame(width: 44, height: 44)
                    
                    if !isUnlocked {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                    } else if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 20, weight: .black))
                            .foregroundStyle(.white)
                    } else {
                        Text("\(lesson.lessonId)")
                            .font(.system(size: 19, weight: .black, design: .rounded))
                            .foregroundStyle(.white)
                    }
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Bài \(lesson.lessonId): \(lesson.title)")
                            .font(.system(size: 16, weight: .heavy, design: .rounded))
                            .foregroundStyle(isUnlocked ? DinoStyle.textDark : Color.gray)
                        
                        Spacer()
                        
                        if isCompleted {
                            HStack(spacing: 2) {
                                Text("⭐⭐⭐")
                                    .font(.system(size: 11))
                            }
                        }
                    }
                    
                    Text("\(lesson.wordCount) từ vựng · 4 hoạt động tương tác")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundStyle(DinoStyle.textMuted)
                }
                
                if isUnlocked {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(topic.themeColor)
                }
            }
            .padding(14)
        }
    }
}
