import SwiftUI

struct OnBoardingPage3View: View {
    @EnvironmentObject var fontManager: FontManager

    @Binding var isExpanded: Bool
    
    @State private var problems: [String] = ["Cancer", "Heart disease", "Type 2 diabetes", "Stroke", "Osteoporosis", "Depression"]

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("Vector")
                    .resizable()
                    .scaleEffect(x: -1, y: 1)
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Image("Onboarding_2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .scaleEffect(x: -1, y: 1)
                        .padding(.trailing, 25)
                        .rotationEffect(.degrees(-15))
                }
                .padding(.top, 50)
                
                Text("Solving Challenges")
                    .font(fontManager.font1)
                
                Spacer()
                
                TypingEffect(fullText: "• According to the hse.ie (Health Service Executive of Ireland), the physical activity helps you improve your overall wellbeing. Moreover, by releasing chemicals (endorphins) in your brain during exercising, it cheers you up.", isExpanded: $isExpanded)
                

                Spacer()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 25) {
                        ForEach(problems, id: \.self) { problem in
                            HStack {
                                Image(problem)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    
                                Spacer()
                                
                                Text(problem)
                                    .foregroundStyle(.black)
                                    .font(fontManager.font2)
                                    .padding(7)
                            }
                            .padding(10)
                            .frame(minWidth: 120, maxWidth: 300)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.secondary.opacity(0.5), lineWidth: 1))
                        }

                        
                    }
                }
                .padding(.horizontal, 20)
                .scrollIndicators(.hidden)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            
        }
    }
}
