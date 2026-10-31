import SwiftUI

/// Điều hướng 4 tab chính: Trang chủ, Chủ đề, Dino, Hồ sơ
public struct MainTabView: View {
    @EnvironmentObject var model: LearningViewModel
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $model.selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Trang chủ", systemImage: "house.fill")
            }
            .tag(0)
            
            NavigationStack {
                TopicListView()
            }
            .tabItem {
                Label("Chủ đề", systemImage: "book.fill")
            }
            .tag(1)
            
            NavigationStack {
                DinoGrowthView()
            }
            .tabItem {
                Label("Dino", systemImage: "star.fill")
            }
            .tag(2)
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Hồ sơ", systemImage: "person.crop.circle.fill")
            }
            .tag(3)
        }
        .tint(DinoStyle.green)
    }
}
