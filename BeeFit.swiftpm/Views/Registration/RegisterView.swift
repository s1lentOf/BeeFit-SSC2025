//
//  RegisterView.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 14.02.2025.
//

import SwiftUI

struct RegisterView: View {
    @AppStorage("isRegistered") var isRegistered: Bool = false
    
    @State private var selectedView = 1
    let onBoardingViewsCount = 3 
    
    @State private var userName: String = ""
    @State private var userGender: String = ""
    @State private var userAge: Int = 18
    
    @State private var showLoadingView = false

        
    init() {
        UIScrollView.appearance().isScrollEnabled = false
    }
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack {
            
            if !showLoadingView {
                VStack {
                    Spacer()
                    
                    TabView(selection: $selectedView) {
                        RegisterPage1View(userName: $userName).tag(1)
                        RegisterPage2View(userGender: $userGender).tag(2)
                        RegisterPage3View(userAge: $userAge).tag(3)
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
                                    showLoadingView = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                                        showLoadingView = false
                                        isRegistered = true
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
                        .disabled(
                            (selectedView == 1 && userName.isEmpty) ||
                            (selectedView == 2 && userGender.isEmpty)
                        )
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
            } else {
                LoadingView()
            }
        }
        .onDisappear {
            user.name = userName
            user.age = userAge
            user.gender = userGender
        }
        .ignoresSafeArea()
    }
}


#Preview {
    RegisterView()
}
