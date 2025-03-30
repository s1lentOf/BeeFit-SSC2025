import SwiftUI 

struct OnBoardingPage1View: View {
    
    @EnvironmentObject var fontManager: FontManager
    
    var body: some View {
        VStack {
            VStack {
                Image("Onboarding_1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding(.bottom, 90)
                
                Text("Hi There!")
                    .font(fontManager.font1)
                    .padding()
                
                VStack {
                    Text("“Take care of your body. It’s the only place you have to live”")
                        .font(fontManager.font2)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Spacer()
                        Text("Jim Ryun")
                            .font(fontManager.font2)
                    }
                    
                }
                .frame(maxWidth: 350)
            }
             
        }   
    }
}

#Preview {
    OnBoardingPage1View()
}
