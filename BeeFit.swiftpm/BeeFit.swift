import SwiftUI

@main
struct BeeFit: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @AppStorage("isRegistered") var isRegistered: Bool = false
    @AppStorage("isTrained") var isTrained: Bool = false
    
    @StateObject var user = User()
    @StateObject var fontManager = FontManager()
    
    @State var show = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if !show {
                    AnimatedTitleView()
                } else {
                    if isOnboarding {
                        OnBoardingView()
                    } else if !isRegistered {
                        RegisterView()
                            .environmentObject(user)
                    } else if !isTrained {
                        TrainingView()
                    } else {
                        TabView {
                            NavigationStack {
                                HomePageView()
                            }
                            .tabItem {
                                Label("Home", systemImage: "house.circle")
                            }
                            .environmentObject(user)
                            .toolbarBackground(.visible, for: .tabBar)
                            
                            ProfilePageView()
                                .tabItem {
                                    Label("Menu", systemImage: "person.crop.circle")
                                }
                                .environmentObject(user)
                        }

                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        show = true
                    }
                }
            }
        } .environmentObject(fontManager)
    }
    
    
}
