import SwiftUI

@main
struct DinoEnglishApp: App {
    @StateObject private var model = LearningViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(model)
        }
    }
}

/// Màn hình gốc quyết định luồng ứng dụng: Onboarding -> Login -> Main Tabs
struct RootView: View {
    @EnvironmentObject var model: LearningViewModel
    
    var body: some View {
        Group {
            if !model.isOnboarded {
                OnboardingView()
            } else if !model.isLoggedIn {
                LoginView()
            } else {
                MainTabView()
            }
        }
        .tint(DinoStyle.green)
    }
}

// Typealias tương thích ngược
typealias LearningModel = LearningViewModel
typealias LearningModelShim = LearningViewModel
