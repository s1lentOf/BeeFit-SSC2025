import SwiftUI
import Foundation

struct OnBoardingPage2View: View {
    
    @EnvironmentObject var fontManager: FontManager
    

    var body: some View {
        VStack {
            HStack {
                Image("Onboarding_2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.leading, 25)
                    .rotationEffect(.degrees(15))
                
                Spacer()
            }
            .padding(.top, 50)
            
            Text("Why 'Bee Fit'?")
                .font(fontManager.font1)
                .padding(.bottom, 40)
            
            VStack {
                Spacer()
                HStack {
                    Text("• Captures and analyzes your workout movements in real time.")
                        .font(fontManager.font2)
                        .multilineTextAlignment(.center)
                }
                .padding(.leading, 70)
                
                Spacer()
                HStack {
                    Text("• Works seamlessly with just your phone or camera.")
                        .font(fontManager.font2)
                        .multilineTextAlignment(.center)
                }
                .padding(.leading, 10)
                .padding(.trailing, 70)
                
                Spacer()
                HStack {
                    Text("• Your personal trainer on your way to the TOP form!")
                        .font(fontManager.font2)
                        .multilineTextAlignment(.center)
                }
                .padding(.leading, 70)
            }
            
            Spacer()
            
            Image("Vector")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingView()
}
