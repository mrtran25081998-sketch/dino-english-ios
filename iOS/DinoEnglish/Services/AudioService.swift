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
            try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("AudioService: Không thể cấu hình AVAudioSession: \(error.localizedDescription)")
        }
    }
    
    /// Đọc một từ hoặc câu tiếng Anh
    public func speak(_ text: String) {
        synthesizer.stopSpeaking(at: .immediate)
        setupAudioSession()
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = voice
        utterance.rate = speechRate
        utterance.pitchMultiplier = 1.05 // Cao độ nhẹ nhàng, thân thiện với trẻ
        utterance.preUtteranceDelay = 0.05
        
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
