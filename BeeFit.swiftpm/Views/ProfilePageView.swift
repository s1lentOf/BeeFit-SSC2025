import SwiftUI

struct ProfilePageView: View {
    @EnvironmentObject var user: User
    
    @EnvironmentObject var fontManager: FontManager
    
    
    var body: some View {
        ZStack {
            
            #if os(iOS) && !targetEnvironment(macCatalyst)
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 400)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(colors: [Color.yellow, Color.yellow.opacity(0.75)]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .scaledToFill()
                .padding(.bottom, 450)
                .ignoresSafeArea()
            #endif
            
            VStack {
                Spacer()
                
                Image(user.gender == "Male" ? "boy_icon" : "girl_icon")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.yellow, lineWidth: 5)
                    )
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 4)
                    .frame(width: 130, height: 130)
                
                
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("Your name:")
                        Spacer()
                        Text(user.name)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Your age:")
                        Spacer()
                        Text("\(user.age)")
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Your gender:")
                        Spacer()
                        Text(user.gender)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Done push-ups:")
                        Spacer()
                        Text("\(user.donePushUps) / \(user.pushUps)")
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Done squats:")
                        Spacer()
                        Text("\(user.doneSquats) / \(user.squats)")
                    }
                }
                .font(fontManager.font2)
                .foregroundStyle(.black)
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                )
                .scaledToFit()
                .padding(.horizontal, 20)
                
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    HomePageView()
}
