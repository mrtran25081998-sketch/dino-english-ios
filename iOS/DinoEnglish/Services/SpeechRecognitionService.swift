import SwiftUI
import Speech
import AVFoundation

/// Dịch vụ nhận diện giọng nói bé tập phát âm tiếng Anh
@MainActor
public final class SpeechRecognitionService: NSObject, ObservableObject, SFSpeechRecognizerDelegate {
    @Published public var transcript: String = ""
    @Published public var isListening: Bool = false
    @Published public var errorMessage: String?
    @Published public var authorizationStatus: SFSpeechRecognizerAuthorizationStatus = .notDetermined
    
    private let engine = AVAudioEngine()
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    override public init() {
        super.init()
        recognizer?.delegate = self
        checkCurrentAuthorization()
    }
    
    private func checkCurrentAuthorization() {
        authorizationStatus = SFSpeechRecognizer.authorizationStatus()
    }
    
    /// Bắt đầu hoặc dừng ghi âm nhận diện
    public func toggleListening(targetWord: String? = nil) {
        if isListening {
            stopListening()
        } else {
            startListening()
        }
    }
    
    public func startListening() {
        guard !isListening else { return }
        errorMessage = nil
        transcript = ""
        
        SFSpeechRecognizer.requestAuthorization { [weak self] status in
            Task { @MainActor in
                self?.authorizationStatus = status
                guard status == .authorized else {
                    self?.errorMessage = "Ba mẹ vui lòng cho phép quyền Nhận diện giọng nói trong Cài đặt của máy."
                    return
                }
                self?.requestMicrophonePermission()
            }
        }
    }
    
    private func requestMicrophonePermission() {
        if #available(iOS 17.0, *) {
            AVAudioApplication.requestRecordPermission { [weak self] granted in
                Task { @MainActor in
                    guard granted else {
                        self?.errorMessage = "Ứng dụng cần quyền sử dụng Micro để bé luyện phát âm."
                        return
                    }
                    self?.beginAudioRecording()
                }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission { [weak self] granted in
                Task { @MainActor in
                    guard granted else {
                        self?.errorMessage = "Ứng dụng cần quyền sử dụng Micro để bé luyện phát âm."
                        return
                    }
                    self?.beginAudioRecording()
                }
            }
        }
    }
    
    private func beginAudioRecording() {
        stopListening()
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .measurement, options: [.defaultToSpeaker, .allowBluetooth])
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            
            let request = SFSpeechAudioBufferRecognitionRequest()
            request.shouldReportPartialResults = true
            recognitionRequest = request
            
            let inputNode = engine.inputNode
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            
            inputNode.removeTap(onBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                request.append(buffer)
            }
            
            engine.prepare()
            try engine.start()
            
            isListening = true
            
            recognitionTask = recognizer?.recognitionTask(with: request) { [weak self] result, error in
                Task { @MainActor in
                    guard let self = self else { return }
                    if let result = result {
                        self.transcript = result.bestTranscription.formattedString
                    }
                    if error != nil || result?.isFinal == true {
                        self.stopListening()
                    }
                }
            }
        } catch {
            errorMessage = "Không thể khởi động thu âm: \(error.localizedDescription)"
            stopListening()
        }
    }
    
    public func stopListening() {
        if engine.isRunning {
            engine.stop()
            engine.inputNode.removeTap(onBus: 0)
        }
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        recognitionTask = nil
        recognitionRequest = nil
        isListening = false
    }
    
    /// Hỗ trợ giả lập phát âm khi chạy trên Xcode Simulator không có micro
    public func simulateMatch(for word: String) {
        transcript = word
    }
    
    /// Kiểm tra so khớp từ phát âm của bé với từ mẫu
    public func checkMatch(with target: String) -> Bool {
        let cleanTranscript = transcript.lowercased()
            .trimmingCharacters(in: .punctuationCharacters.union(.whitespacesAndNewlines))
        let cleanTarget = target.lowercased()
            .trimmingCharacters(in: .punctuationCharacters.union(.whitespacesAndNewlines))
        
        return cleanTranscript == cleanTarget || cleanTranscript.contains(cleanTarget)
    }
}
