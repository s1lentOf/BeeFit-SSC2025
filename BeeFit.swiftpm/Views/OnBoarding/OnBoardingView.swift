import SwiftUI

struct OnBoardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    @State private var selectedView = 1
    let onBoardingViewsCount = 3
    
    @State private var isExpanded = false

    init() {
        UIScrollView.appearance().isScrollEnabled = false
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                TabView(selection: $selectedView) {
                    OnBoardingPage1View().tag(1)
                    OnBoardingPage2View().tag(2)
                    OnBoardingPage3View(isExpanded: $isExpanded).tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(maxHeight: .infinity)

            }
            
            VStack {
                Spacer()

                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            if selectedView == 2 {
                                isExpanded = true
                            }
                            if selectedView == onBoardingViewsCount {
                                isOnboarding = false
                            } else {
                                selectedView += 1
                            }
                            
                        }
                    }) {
                        Image(selectedView != onBoardingViewsCount ? "Arrow_Right" : "Home_Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .animation(.easeInOut(duration: 0.3), value: selectedView)
                    }
                    .padding(30)
                }

            }
            
            VStack {
                Spacer()
                HStack {
                    TabViewIndicator(count: onBoardingViewsCount, selected: selectedView)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.bottom, 50)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingView()
}
 
