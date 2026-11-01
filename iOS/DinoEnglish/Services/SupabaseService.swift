import Foundation

/// Dịch vụ kết nối trực tiếp Supabase Backend (Project: wsaalmeuduiyqbptnrmy)
/// Hỗ trợ: Đăng ký, Đăng nhập, Đồng bộ tiến độ bài học và sao vàng
public final class SupabaseService {
    public static let shared = SupabaseService()
    
    // Cấu hình Project Supabase
    public static let projectURL = "https://wsaalmeuduiyqbptnrmy.supabase.co"
    
    // Khóa anon public key (có thể ghi đè qua UserDefaults hoặc file config)
    public var anonKey: String {
        get {
            UserDefaults.standard.string(forKey: "DINO_SUPABASE_ANON_KEY") ?? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.dummy_anon_key"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "DINO_SUPABASE_ANON_KEY")
        }
    }
    
    // Token xác thực của người dùng hiện tại
    public var accessToken: String? {
        get { UserDefaults.standard.string(forKey: "DINO_AUTH_TOKEN") }
        set { UserDefaults.standard.set(newValue, forKey: "DINO_AUTH_TOKEN") }
    }
    
    public var currentUserId: String? {
        get { UserDefaults.standard.string(forKey: "DINO_USER_ID") }
        set { UserDefaults.standard.set(newValue, forKey: "DINO_USER_ID") }
    }
    
    public var currentUserEmail: String? {
        get { UserDefaults.standard.string(forKey: "DINO_USER_EMAIL") }
        set { UserDefaults.standard.set(newValue, forKey: "DINO_USER_EMAIL") }
    }
    
    public var isAuthenticated: Bool {
        return accessToken != nil && currentUserId != nil
    }
    
    private init() {}
    
    // MARK: - ĐĂNG KÝ TÀI KHOẢN MỚI
    public func signUp(email: String, password: String, kidName: String) async throws -> (userId: String, token: String) {
        guard let url = URL(string: "\(Self.projectURL)/auth/v1/signup") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(anonKey, forHTTPHeaderField: "apikey")
        
        let body: [String: Any] = [
            "email": email,
            "password": password,
            "data": [
                "kid_name": kidName
            ]
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let errorText = String(data: data, encoding: .utf8) ?? "Đăng ký thất bại"
            throw NSError(domain: "SupabaseError", code: 400, userInfo: [NSLocalizedDescriptionKey: errorText])
        }
        
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        let token = json?["access_token"] as? String ?? ""
        let user = json?["user"] as? [String: Any]
        let userId = user?["id"] as? String ?? ""
        
        self.accessToken = token.isEmpty ? nil : token
        self.currentUserId = userId
        self.currentUserEmail = email
        
        return (userId, token)
    }
    
    // MARK: - ĐĂNG NHẬP
    public func signIn(email: String, password: String) async throws -> (userId: String, token: String) {
        guard let url = URL(string: "\(Self.projectURL)/auth/v1/token?grant_type=password") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(anonKey, forHTTPHeaderField: "apikey")
        
        let body: [String: Any] = [
            "email": email,
            "password": password
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let errorText = String(data: data, encoding: .utf8) ?? "Sai email hoặc mật khẩu"
            throw NSError(domain: "SupabaseError", code: 401, userInfo: [NSLocalizedDescriptionKey: errorText])
        }
        
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let token = json?["access_token"] as? String,
              let user = json?["user"] as? [String: Any],
              let userId = user["id"] as? String else {
            throw NSError(domain: "SupabaseError", code: 500, userInfo: [NSLocalizedDescriptionKey: "Phản hồi xác thực không hợp lệ"])
        }
        
        self.accessToken = token
        self.currentUserId = userId
        self.currentUserEmail = email
        
        return (userId, token)
    }
    
    // MARK: - ĐĂNG XUẤT
    public func signOut() {
        self.accessToken = nil
        self.currentUserId = nil
        self.currentUserEmail = nil
    }
    
    // MARK: - ĐỒNG BỘ TIẾN ĐỘ BÀI HỌC LÊN SUPABASE
    public func saveLessonCompleted(topicId: String, lessonId: Int) async throws {
        guard let token = accessToken, let userId = currentUserId else { return }
        guard let url = URL(string: "\(Self.projectURL)/rest/v1/lesson_progress") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(anonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("resolution=ignore-duplicates", forHTTPHeaderField: "Prefer")
        
        let lessonKey = "\(topicId)_l\(lessonId)"
        let body: [String: Any] = [
            "user_id": userId,
            "topic_id": topicId,
            "lesson_id": lessonId,
            "lesson_key": lessonKey,
            "stars_earned": 5,
            "is_completed": true
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        _ = try await URLSession.shared.data(for: request)
    }
    
    // MARK: - TẢI DANH SÁCH BÀI HỌC ĐÃ HOÀN THÀNH TỪ SUPABASE VỀ MÁY
    public func fetchCompletedLessons() async throws -> [String] {
        guard let token = accessToken, let userId = currentUserId else { return [] }
        guard let url = URL(string: "\(Self.projectURL)/rest/v1/lesson_progress?user_id=eq.\(userId)&select=lesson_key") else { return [] }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(anonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            return []
        }
        
        let json = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] ?? []
        return json.compactMap { $0["lesson_key"] as? String }
    }
}
