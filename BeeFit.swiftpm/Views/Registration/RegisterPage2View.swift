//
//  RegisterPage2View.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 14.02.2025.
//

import SwiftUI

struct RegisterPage2View: View {
    @EnvironmentObject var fontManager: FontManager
    @Binding var userGender: String
    
    var genders: [String] = ["Male", "Female"]
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Select your gender")
                    .font(fontManager.font1)
                    .padding(.vertical, 5)
                
                Text("Let us get to know your gender, so we can personalize your experience")
                    .font(fontManager.font2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
            
            VStack (alignment: .leading){
                Text("Your gender")
                    .font(fontManager.font2)
                    .foregroundStyle(.secondary)
                
                Picker("User gender", selection: $userGender) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            .padding(.horizontal, 10)

            Spacer()
            Spacer()
            Spacer()
        }
    }
    
}

#Preview {
    RegisterView()
}
