import SwiftUI

/// Cột mốc trưởng thành của khủng long Dino (20 cấp độ)
public struct DinoMilestone: Identifiable, Hashable {
    public let level: Int
    public let title: String
    public let stageName: String
    public let requiredLessons: Int
    public let requiredStars: Int
    public let mascot: DinoMascot
    public let badgeSymbol: String
    public let rewardDescription: String
}

/// Hệ thống quản lý sự trưởng thành của Dino qua 20 cột mốc
public enum DinoEvolutionManager {
    public static let milestones: [DinoMilestone] = [
        // Giai đoạn 1: Level 1-5 (Dino sơ sinh / mascot level1)
        DinoMilestone(level: 1, title: "Trứng Vàng Nứt Vỏ", stageName: "Dino Sơ Sinh", requiredLessons: 1, requiredStars: 5, mascot: .level1, badgeSymbol: "sparkles", rewardDescription: "Dino chào đời và bắt đầu làm quen với những từ vựng đầu tiên!"),
        DinoMilestone(level: 2, title: "Chập Chững Khám Phá", stageName: "Dino Sơ Sinh", requiredLessons: 2, requiredStars: 15, mascot: .level1, badgeSymbol: "figure.walk", rewardDescription: "Dino biết tập đi và bắt chước tiếng kêu của muôn loài."),
        DinoMilestone(level: 3, title: "Đôi Mắt Tò Mò", stageName: "Dino Sơ Sinh", requiredLessons: 4, requiredStars: 30, mascot: .level1, badgeSymbol: "eye.fill", rewardDescription: "Dino mở to đôi mắt nhìn ngắm muôn màu sắc rực rỡ."),
        DinoMilestone(level: 4, title: "Nụ Cười Rạng Rỡ", stageName: "Dino Sơ Sinh", requiredLessons: 6, requiredStars: 50, mascot: .level1, badgeSymbol: "face.smiling.fill", rewardDescription: "Dino mỉm cười vui sướng khi nhận được thật nhiều ngôi sao."),
        DinoMilestone(level: 5, title: "Đôi Chân Nhanh Nhẹn", stageName: "Dino Sơ Sinh", requiredLessons: 8, requiredStars: 70, mascot: .level1, badgeSymbol: "bolt.fill", rewardDescription: "Dino chạy tung tăng trên đồng cỏ xanh mát."),
        
        // Giai đoạn 2: Level 6-10 (Dino đi học / mascot level2)
        DinoMilestone(level: 6, title: "Ba Lô Nhỏ Xinh", stageName: "Dino Năng Động", requiredLessons: 10, requiredStars: 95, mascot: .level2, badgeSymbol: "backpack.fill", rewardDescription: "Dino đeo chiếc ba lô vàng xinh xắn sẵn sàng đến trường."),
        DinoMilestone(level: 7, title: "Người Bạn Thân Thiết", stageName: "Dino Năng Động", requiredLessons: 12, requiredStars: 120, mascot: .level2, badgeSymbol: "person.2.fill", rewardDescription: "Dino kết thêm nhiều người bạn mới trong lớp học."),
        DinoMilestone(level: 8, title: "Phát Âm Rõ Ràng", stageName: "Dino Năng Động", requiredLessons: 15, requiredStars: 150, mascot: .level2, badgeSymbol: "mic.fill", rewardDescription: "Dino nói tiếng Anh thật tròn vành rõ chữ."),
        DinoMilestone(level: 9, title: "Nhà Thám Hiểm Nhí", stageName: "Dino Năng Động", requiredLessons: 18, requiredStars: 180, mascot: .level2, badgeSymbol: "binoculars.fill", rewardDescription: "Dino khám phá thế giới tự nhiên và các phương tiện giao thông."),
        DinoMilestone(level: 10, title: "Vượt Trưởng Thách", stageName: "Dino Năng Động", requiredLessons: 20, requiredStars: 215, mascot: .level2, badgeSymbol: "star.circle.fill", rewardDescription: "Dino hoàn thành xuất sắc 20 bài học đầu tiên!"),
        
        // Giai đoạn 3: Level 11-15 (Dino thông thái / mascot level3)
        DinoMilestone(level: 11, title: "Tủ Sách Kỳ Diệu", stageName: "Dino Thông Thái", requiredLessons: 25, requiredStars: 250, mascot: .level3, badgeSymbol: "book.closed.fill", rewardDescription: "Dino mở trang sách thần kỳ chứa đầy từ vựng thú vị."),
        DinoMilestone(level: 12, title: "Ngôi Sao Đố Vui", stageName: "Dino Thông Thái", requiredLessons: 30, requiredStars: 300, mascot: .level3, badgeSymbol: "questionmark.circle.fill", rewardDescription: "Dino trả lời đúng mọi câu hỏi trong các trò chơi."),
        DinoMilestone(level: 13, title: "Ca Sĩ Nhí", stageName: "Dino Thông Thái", requiredLessons: 35, requiredStars: 350, mascot: .level3, badgeSymbol: "music.note.list", rewardDescription: "Dino hát vang những giai điệu tiếng Anh rộn ràng."),
        DinoMilestone(level: 14, title: "Hiệp Sĩ Tử Tế", stageName: "Dino Thông Thái", requiredLessons: 40, requiredStars: 400, mascot: .level3, badgeSymbol: "shield.fill", rewardDescription: "Dino luôn biết chia sẻ, cảm ơn và giúp đỡ bạn bè."),
        DinoMilestone(level: 15, title: "Bậc Thầy Trí Nhớ", stageName: "Dino Thông Thái", requiredLessons: 50, requiredStars: 500, mascot: .level3, badgeSymbol: "brain.head.profile", rewardDescription: "Dino ghi nhớ hàng trăm từ vựng của nhiều chủ đề khác nhau!"),
        
        // Giai đoạn 4: Level 16-20 (Dino tốt nghiệp đại tài / mascot level4)
        DinoMilestone(level: 16, title: "Hành Trình Bứt Phá", stageName: "Dino Trưởng Thành", requiredLessons: 60, requiredStars: 600, mascot: .level4, badgeSymbol: "arrow.up.forward.circle.fill", rewardDescription: "Dino bước vào giai đoạn trưởng thành vững vàng."),
        DinoMilestone(level: 17, title: "Ngôi Sao Sáng Ngời", stageName: "Dino Trưởng Thành", requiredLessons: 75, requiredStars: 750, mascot: .level4, badgeSymbol: "sparkle.magnifyingglass", rewardDescription: "Dino tự tin giao tiếp và thể hiện tình yêu tiếng Anh."),
        DinoMilestone(level: 18, title: "Nhà Vô Địch Học Tập", stageName: "Dino Trưởng Thành", requiredLessons: 90, requiredStars: 900, mascot: .level4, badgeSymbol: "trophy.fill", rewardDescription: "Dino đạt danh hiệu vô địch với bộ sưu tập sao khổng lồ."),
        DinoMilestone(level: 19, title: "Tiến Đến Đỉnh Cao", stageName: "Dino Trưởng Thành", requiredLessons: 105, requiredStars: 1050, mascot: .level4, badgeSymbol: "flag.checkered.2.crossed", rewardDescription: "Chỉ còn một bước nữa là Dino sẽ tốt nghiệp hoàn hảo!"),
        DinoMilestone(level: 20, title: "Thủ Khoa Toàn Năng", stageName: "Dino Trưởng Thành", requiredLessons: 120, requiredStars: 1200, mascot: .level4, badgeSymbol: "crown.fill", rewardDescription: "Dino vinh dự đội chiếc mũ cử nhân tốt nghiệp toàn khóa 120 bài học!")
    ]
    
    /// Xác định cấp độ hiện tại dựa trên số bài học đã hoàn thành
    public static func currentMilestone(completedLessons: Int) -> DinoMilestone {
        var active = milestones[0]
        for m in milestones {
            if completedLessons >= m.requiredLessons {
                active = m
            } else {
                break
            }
        }
        return active
    }
    
    /// Linh vật đại diện cho cấp độ hiện tại
    public static func currentMascot(completedLessons: Int) -> DinoMascot {
        currentMilestone(completedLessons: completedLessons).mascot
    }
}
