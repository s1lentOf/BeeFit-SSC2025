import SwiftUI

struct HomePageView: View {
    @State private var selectedLevel = 0
    @State private var startAnimation: Bool = false
    
    @EnvironmentObject var user: User
        
    var body: some View {
        
        ZStack {
            ZStack {
                LinearGradient(
                    colors: [
                        .yellow,
                        .orange],
                    startPoint: startAnimation ? .topLeading : .bottomLeading,
                    endPoint: startAnimation ? .bottomTrailing : .topTrailing
                )
            }
            .ignoresSafeArea()
            
            LevelsProgressView(levels: $user.defaultLevels, selectedLevel: $selectedLevel)
                .tint(.indigo)
                .navigationTitle("Progress Map")
        }
        .onAppear {
            withAnimation(.linear(duration: 2.0).repeatForever()) {
                startAnimation.toggle()
            }
        }            
        
        
        
    }
}

#Preview {
    HomePageView()
}
