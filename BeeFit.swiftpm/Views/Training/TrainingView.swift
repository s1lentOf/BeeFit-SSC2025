//
//  TrainingView.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 20.02.2025.
//

import SwiftUI

struct TrainingView: View {
    @AppStorage("isTrained") var isTrained: Bool = false
    
    @State private var selectedView = 1
    let onBoardingViewsCount = 3
    
    @State private var isExpanded = false

    init() {
        UIScrollView.appearance().isScrollEnabled = false
    }

    @EnvironmentObject var fontManager: FontManager
    @State private var showTrainingCompletion = false
    
    var body: some View {
        if !showTrainingCompletion {
            ZStack {
                VStack {
                    Spacer()
                    
                    TabView(selection: $selectedView) {
                        Training1View().tag(1)
                        Training2View().tag(2)
                        Training3View().tag(3)
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
                                if selectedView == onBoardingViewsCount {
                                    showTrainingCompletion = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                        showTrainingCompletion = false
                                        isTrained = true
                                    }
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
        
        else {
            VStack {
                CompletionView()
                    .padding(.bottom, 70)
                
                Text("You're good to go!")
                    .font(fontManager.font1)
            }
        }
    }

}
