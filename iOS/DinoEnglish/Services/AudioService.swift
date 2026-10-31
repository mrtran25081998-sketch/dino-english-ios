import AVFoundation
import SwiftUI

/// Dịch vụ phát âm thanh chuẩn bản ngữ sử dụng AVSpeechSynthesizer
@MainActor
public final class AudioService: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    public static let shared = AudioService()
    
    @Published public private(set) var isSpeaking: Bool = false
    @Published public var speechRate: Float = 0.43 // Tốc độ vừa phải cho trẻ nhỏ
    
    private let synthesizer = AVSpeechSynthesizer()
    private let voice = AVSpeechSynthesisVoice(language: "en-US")
    
    override private init() {
        super.init()
        synthesizer.delegate = self
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            // Sử dụng chế độ .playback chất lượng cao 48kHz (thay vì .playAndRecord thoại gây rè loa)
            try session.setCategory(.playback, mode: .spokenAudio, options: [.duckOthers])
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("AudioService: Không thể cấu hình AVAudioSession: \(error.localizedDescription)")
        }
    }
    
    private func getOptimalVoice(for text: String) -> AVSpeechSynthesisVoice? {
        let isVietnamese = text.range(of: "[àáảãạăắằẳẵặâấầẩẫậèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵđ]", options: .regularExpression) != nil
        let targetLanguage = isVietnamese ? "vi-VN" : "en-US"
        
        let availableVoices = AVSpeechSynthesisVoice.speechVoices()
        // Ưu tiên giọng đọc Enhanced / Premium chất lượng phòng thu của Apple
        if let enhancedVoice = availableVoices.first(where: { $0.language == targetLanguage && $0.quality == .enhanced }) {
            return enhancedVoice
        }
        return AVSpeechSynthesisVoice(language: targetLanguage)
    }
    
    /// Đọc một từ hoặc câu tiếng Anh chuẩn xác
    public func speak(_ text: String) {
        synthesizer.stopSpeaking(at: .immediate)
        setupAudioSession()
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = getOptimalVoice(for: text)
        utterance.rate = speechRate
        utterance.pitchMultiplier = 1.0 // Cao độ chuẩn tự nhiên, chống méo tiếng
        utterance.volume = 1.0
        
        isSpeaking = true
        synthesizer.speak(utterance)
    }
    
    /// Dừng phát âm
    public func stop() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        isSpeaking = false
    }
    
    // MARK: - AVSpeechSynthesizerDelegate
    public nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.isSpeaking = false
        }
    }
    
    public nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.isSpeaking = false
        }
    }
}
