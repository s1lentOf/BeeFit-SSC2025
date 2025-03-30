//
//  RegisterPage3View.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 14.02.2025.
//

import SwiftUI

struct RegisterPage3View: View {
    @EnvironmentObject var fontManager: FontManager
    @Binding var userAge: Int
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Select your age")
                    .font(fontManager.font1)
                    .padding(.vertical, 5)
                
                Text("Choose your age, so we give you appropriate amount of reps")
                    .font(fontManager.font2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
            
            Text("\(userAge)")
                .font(fontManager.font1)
            
            
            HStack {
                Text("Your age")
                    .font(fontManager.font2)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Picker("Your age", selection: $userAge) {
                    ForEach(10..<100, id: \.self) { number in
                        Text("\(number)")
                    }
                }
                .pickerStyle(.menu)
            }
            .padding(.horizontal, 10)

            Spacer()
            Spacer()
            Spacer()
        }
        .onAppear(perform: {
            UIScrollView.appearance().isScrollEnabled = true
        })
        .padding(20)
    }
}

#Preview {
    RegisterView()
}
