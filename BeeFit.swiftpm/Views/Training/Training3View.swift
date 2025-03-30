//
//  Training3View.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 20.02.2025.
//

import SwiftUI

struct Training3View: View {
    @EnvironmentObject var fontManager: FontManager
    
    var body: some View {
        VStack {
            Spacer()
            Text("Step 3")
                .font(fontManager.font1)
                .padding()
            
            Text("Try to make each rep as clean as possible. This will help our algorithm count your reps accurately.")
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image(systemName: "figure.cooldown")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    Training3View()
        .environmentObject(FontManager())
}
