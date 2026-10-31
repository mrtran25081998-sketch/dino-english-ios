import Foundation

/// Cấu trúc file JSON tổng hợp
private struct DatabaseContainer: Codable {
    let version: String
    let totalTopics: Int
    let totalLessons: Int
    let totalWords: Int
    let topics: [DinoTopic]
}

/// Kho dữ liệu nội dung bài học 1,200 từ vựng của Dino English
public final class DinoContentRepository {
    public static let shared = DinoContentRepository()
    
    public private(set) var topics: [DinoTopic] = []
    private var wordsMap: [String: VocabularyWord] = [:]
    
    public init() {
        loadContent()
    }
    
    private func loadContent() {
        // Thử đọc từ Bundle
        if let url = Bundle.main.url(forResource: "DinoContent", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let container = try decoder.decode(DatabaseContainer.self, from: data)
                self.topics = container.topics
                buildIndex()
                return
            } catch {
                print("DinoContentRepository: Lỗi đọc DinoContent.json: \(error.localizedDescription)")
            }
        }
        
        // Thử tìm trong đường dẫn thư mục hiện tại (dành cho Preview hoặc unit tests)
        let localPath = "Data/DinoContent.json"
        if FileManager.default.fileExists(atPath: localPath) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: localPath))
                let container = try JSONDecoder().decode(DatabaseContainer.self, from: data)
                self.topics = container.topics
                buildIndex()
                return
            } catch {
                print("DinoContentRepository: Lỗi giải mã local JSON: \(error)")
            }
        }
        
        // Bộ dữ liệu khởi tạo dự phòng tối thiểu đảm bảo app không bao giờ bị crash
        self.topics = fallbackTopics()
        buildIndex()
    }
    
    private func buildIndex() {
        wordsMap.removeAll()
        for t in topics {
            for l in t.lessons {
                for w in l.words {
                    wordsMap[w.id] = w
                }
            }
        }
    }
    
    public func getTopic(id: String) -> DinoTopic? {
        topics.first { $0.id == id }
    }
    
    public func getLesson(topicId: String, lessonId: Int) -> DinoLesson? {
        guard let topic = getTopic(id: topicId) else { return nil }
        return topic.lessons.first { $0.lessonId == lessonId }
    }
    
    public func getWord(id: String) -> VocabularyWord? {
        wordsMap[id]
    }
    
    /// Sinh các câu hỏi trắc nghiệm thông minh với đáp án nhiễu lấy từ cùng bài học / cùng chủ đề (không trùng lặp)
    public func generateQuizQuestions(for lesson: DinoLesson, count: Int = 5) -> [QuizQuestion] {
        let lessonWords = lesson.words
        guard !lessonWords.isEmpty else { return [] }
        
        var questions: [QuizQuestion] = []
        let selectedTargets = lessonWords.shuffled().prefix(count)
        
        for target in selectedTargets {
            // Lấy 3 đáp án nhiễu từ các từ khác trong cùng bài học
            var distractors = lessonWords.filter { $0.id != target.id }.shuffled()
            
            // Nếu không đủ, bổ sung từ các bài khác cùng chủ đề
            if distractors.count < 3, let topic = getTopic(id: lesson.topicId) {
                let allTopicWords = topic.lessons.flatMap { $0.words }.filter { $0.id != target.id && !distractors.contains($0) }
                distractors.append(contentsOf: allTopicWords.shuffled().prefix(3 - distractors.count))
            }
            
            var options = Array(distractors.prefix(3))
            options.append(target)
            options.shuffle()
            
            questions.append(QuizQuestion(targetWord: target, options: options))
        }
        
        return questions
    }
    
    private func fallbackTopics() -> [DinoTopic] {
        let sampleWords = [
            VocabularyWord(id: "animals_01_cat", topicId: "animals", lessonId: 1, wordIndex: 1, english: "cat", vietnamese: "con mèo", ipa: "/kæt/", example: "The cat is sleeping.", exampleVi: "Con mèo đang ngủ.", symbolName: "pawprint.fill"),
            VocabularyWord(id: "animals_01_dog", topicId: "animals", lessonId: 1, wordIndex: 2, english: "dog", vietnamese: "con chó", ipa: "/dɒɡ/", example: "The dog wags its tail.", exampleVi: "Con chó vẫy đuôi.", symbolName: "pawprint.fill"),
            VocabularyWord(id: "animals_01_fish", topicId: "animals", lessonId: 1, wordIndex: 3, english: "fish", vietnamese: "con cá", ipa: "/fɪʃ/", example: "The fish swims fast.", exampleVi: "Con cá bơi rất nhanh.", symbolName: "fish.fill"),
            VocabularyWord(id: "animals_01_bird", topicId: "animals", lessonId: 1, wordIndex: 4, english: "bird", vietnamese: "con chim", ipa: "/bɜːd/", example: "The bird can sing.", exampleVi: "Con chim biết hót.", symbolName: "bird.fill")
        ]
        
        let sampleLesson = DinoLesson(lessonId: 1, topicId: "animals", title: "Thú cưng thân quen", wordCount: sampleWords.count, words: sampleWords)
        let sampleTopic = DinoTopic(
            id: "animals",
            nameEn: "Animals",
            nameVi: "Con vật",
            icon: "pawprint.fill",
            colorHex: "#30A953",
            description: "Khám phá thế giới động vật đáng yêu cùng Dino",
            lessonCount: 1,
            wordCount: sampleWords.count,
            song: DinoSong(topicId: "animals", title: "Animal Friends Chant", lines: ["Cat says meow!", "Dog says woof!"], linesVi: ["Mèo kêu meo!", "Chó sủa gâu!"]),
            lessons: [sampleLesson]
        )
        return [sampleTopic]
    }
}
