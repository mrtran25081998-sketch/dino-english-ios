import SwiftUI
import Combine

/// Quản lý toàn bộ trạng thái tiến độ học tập, tích sao, cấp độ và sự trưởng thành của Dino
@MainActor
public final class LearningViewModel: ObservableObject {
    public static let shared = LearningViewModel()
    
    // MARK: - Trạng thái người dùng
    @Published public var isOnboarded: Bool {
        didSet { UserDefaults.standard.set(isOnboarded, forKey: "dino_onboarded") }
    }
    @Published public var isLoggedIn: Bool {
        didSet { UserDefaults.standard.set(isLoggedIn, forKey: "dino_logged_in") }
    }
    @Published public var childName: String {
        didSet { UserDefaults.standard.set(childName, forKey: "dino_child_name") }
    }
    @Published public var stars: Int {
        didSet { UserDefaults.standard.set(stars, forKey: "dino_stars") }
    }
    @Published public var completedLessonsCount: Int {
        didSet { UserDefaults.standard.set(completedLessonsCount, forKey: "dino_completed_lessons") }
    }
    @Published public var completedLessonIDs: Set<String> {
        didSet { UserDefaults.standard.set(Array(completedLessonIDs), forKey: "dino_completed_lesson_ids") }
    }
    @Published public var completedActivityIDs: Set<String> {
        didSet { UserDefaults.standard.set(Array(completedActivityIDs), forKey: "dino_completed_activity_ids") }
    }
    @Published public var dailyStreak: Int {
        didSet { UserDefaults.standard.set(dailyStreak, forKey: "dino_daily_streak") }
    }
    
    // MARK: - Trạng thái điều hướng
    @Published public var selectedTab: Int = 0
    @Published public var currentSelectedTopic: DinoTopic?
    @Published public var currentSelectedLesson: DinoLesson?
    
    // Trạng thái phần thưởng vừa nhận
    @Published public var latestRewardPoints: Int = 0
    @Published public var showRewardCelebration: Bool = false
    
    public init() {
        self.isOnboarded = UserDefaults.standard.bool(forKey: "dino_onboarded")
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "dino_logged_in")
        self.childName = UserDefaults.standard.string(forKey: "dino_child_name") ?? "Bé Na"
        self.stars = UserDefaults.standard.object(forKey: "dino_stars") as? Int ?? 10
        self.completedLessonsCount = UserDefaults.standard.integer(forKey: "dino_completed_lessons")
        
        let storedLessonIDs = UserDefaults.standard.stringArray(forKey: "dino_completed_lesson_ids") ?? []
        self.completedLessonIDs = Set(storedLessonIDs)
        
        let storedActivityIDs = UserDefaults.standard.stringArray(forKey: "dino_completed_activity_ids") ?? []
        self.completedActivityIDs = Set(storedActivityIDs)
        
        self.dailyStreak = max(UserDefaults.standard.integer(forKey: "dino_daily_streak"), 1)
        
        // Khởi tạo chủ đề và bài học mặc định
        if let firstTopic = DinoContentRepository.shared.topics.first {
            self.currentSelectedTopic = firstTopic
            self.currentSelectedLesson = firstTopic.lessons.first
        }
    }
    
    // MARK: - Cột mốc & Sự trưởng thành của Dino
    public var currentMilestone: DinoMilestone {
        DinoEvolutionManager.currentMilestone(completedLessons: completedLessonsCount)
    }
    
    public var currentMascot: DinoMascot {
        DinoEvolutionManager.currentMascot(completedLessons: completedLessonsCount)
    }
    
    public var nextMilestone: DinoMilestone? {
        let currentLevel = currentMilestone.level
        return DinoEvolutionManager.milestones.first { $0.level == currentLevel + 1 }
    }
    
    public var evolutionProgress: Double {
        if let next = nextMilestone {
            let currentReq = currentMilestone.requiredLessons
            let nextReq = next.requiredLessons
            let progressSpan = Double(nextReq - currentReq)
            guard progressSpan > 0 else { return 1.0 }
            let completedInSpan = Double(completedLessonsCount - currentReq)
            return min(max(completedInSpan / progressSpan, 0.0), 1.0)
        }
        return 1.0
    }
    
    // MARK: - Hệ thống thưởng và khóa bài
    /// Nhận thưởng cho một hoạt động (chống nhận thưởng lặp lại vô tội vạ)
    @discardableResult
    public func rewardActivity(topicId: String, lessonId: Int, activityType: String, points: Int = 5) -> Bool {
        let activityKey = "\(topicId)_l\(lessonId)_\(activityType)"
        
        if completedActivityIDs.insert(activityKey).inserted {
            stars += points
            latestRewardPoints = points
            
            // Kiểm tra nếu đã hoàn thành đủ các hoạt động chính của bài học
            checkLessonCompletion(topicId: topicId, lessonId: lessonId)
            
            showRewardCelebration = true
            return true
        } else {
            // Đã hoàn thành trước đó (chế độ ôn tập lại)
            latestRewardPoints = 0
            return false
        }
    }
    
    private func checkLessonCompletion(topicId: String, lessonId: Int) {
        let lessonKey = "\(topicId)_l\(lessonId)"
        if completedLessonIDs.insert(lessonKey).inserted {
            completedLessonsCount += 1
        }
    }
    
    /// Kiểm tra bài học đã mở khóa chưa
    public func isLessonUnlocked(topicId: String, lessonId: Int) -> Bool {
        // Bài 1 của mỗi chủ đề luôn mở
        if lessonId == 1 { return true }
        
        // Bài tiếp theo mở khi bài trước đó đã hoàn thành
        let previousLessonKey = "\(topicId)_l\(lessonId - 1)"
        return completedLessonIDs.contains(previousLessonKey)
    }
    
    /// Kiểm tra bài học đã hoàn thành chưa
    public func isLessonCompleted(topicId: String, lessonId: Int) -> Bool {
        completedLessonIDs.contains("\(topicId)_l\(lessonId)")
    }
    
    /// Tính tỷ lệ hoàn thành của một chủ đề (0..100%)
    public func topicCompletionPercentage(topic: DinoTopic) -> Int {
        guard topic.lessonCount > 0 else { return 0 }
        let completedInTopic = topic.lessons.filter { isLessonCompleted(topicId: topic.id, lessonId: $0.lessonId) }.count
        return Int((Double(completedInTopic) / Double(topic.lessonCount)) * 100)
    }
    
    /// Đặt lại toàn bộ tiến độ (dành cho phụ huynh)
    public func resetProgress() {
        stars = 10
        completedLessonsCount = 0
        completedLessonIDs.removeAll()
        completedActivityIDs.removeAll()
        dailyStreak = 1
    }
}
