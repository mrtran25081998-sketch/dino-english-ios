import SwiftUI

/// Cấu trúc một từ vựng tiếng Anh hoàn chỉnh
public struct VocabularyWord: Identifiable, Codable, Hashable {
    public let id: String
    public let topicId: String
    public let lessonId: Int
    public let wordIndex: Int
    public let english: String
    public let vietnamese: String
    public let ipa: String
    public let example: String
    public let exampleVi: String
    public let symbolName: String
    public let emoji: String?
    public let difficulty: String
    
    public init(
        id: String,
        topicId: String,
        lessonId: Int,
        wordIndex: Int,
        english: String,
        vietnamese: String,
        ipa: String,
        example: String,
        exampleVi: String,
        symbolName: String = "star.fill",
        emoji: String? = nil,
        difficulty: String = "beginner"
    ) {
        self.id = id
        self.topicId = topicId
        self.lessonId = lessonId
        self.wordIndex = wordIndex
        self.english = english
        self.vietnamese = vietnamese
        self.ipa = ipa
        self.example = example
        self.exampleVi = exampleVi
        self.symbolName = symbolName
        self.emoji = emoji
        self.difficulty = difficulty
    }
}

/// Cấu trúc một bài hát tiếng Anh thiếu nhi theo chủ đề
public struct DinoSong: Identifiable, Codable, Hashable {
    public var id: String { topicId }
    public let topicId: String
    public let title: String
    public let lines: [String]
    public let linesVi: [String]
    
    public init(topicId: String, title: String, lines: [String], linesVi: [String]) {
        self.topicId = topicId
        self.title = title
        self.lines = lines
        self.linesVi = linesVi
    }
}

/// Cấu trúc một bài học (10 từ mỗi bài)
public struct DinoLesson: Identifiable, Codable, Hashable {
    public var id: String { "\(topicId)_lesson_\(lessonId)" }
    public let lessonId: Int
    public let topicId: String
    public let title: String
    public let wordCount: Int
    public let words: [VocabularyWord]
}

/// Cấu trúc một chủ đề (10 bài học = 100 từ mỗi chủ đề)
public struct DinoTopic: Identifiable, Codable, Hashable {
    public let id: String
    public let nameEn: String
    public let nameVi: String
    public let icon: String
    public let colorHex: String
    public let description: String
    public let lessonCount: Int
    public let wordCount: Int
    public let song: DinoSong?
    public let lessons: [DinoLesson]
    
    public var themeColor: Color {
        Color(hex: colorHex) ?? DinoStyle.green
    }
}

/// Mô hình câu hỏi trắc nghiệm
public struct QuizQuestion: Identifiable {
    public let id = UUID()
    public let targetWord: VocabularyWord
    public let options: [VocabularyWord]
    
    public var prompt: String {
        targetWord.english
    }
}

// Tiện ích hỗ trợ đọc mã màu hex
extension Color {
    init?(hex: String) {
        var cleanHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanHex.hasPrefix("#") { cleanHex.removeFirst() }
        guard cleanHex.count == 6, let intCode = UInt64(cleanHex, radix: 16) else { return nil }
        let r = Double((intCode >> 16) & 0xFF) / 255.0
        let g = Double((intCode >> 8) & 0xFF) / 255.0
        let b = Double(intCode & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
