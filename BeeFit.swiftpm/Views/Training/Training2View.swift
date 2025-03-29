//
//  Training2View.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 20.02.2025.
//

import SwiftUI

struct Training2View: View {
    @EnvironmentObject var fontManager: FontManager
    
    var body: some View {
        VStack {
            Spacer()
            Text("Step 2")
                .font(fontManager.font1)
                .padding()
            
            Text("Make sure your entire body is visible to the camera. Try to stay within the camera's frame so our algorithm can accurately count your reps.")
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image(systemName: "figure.seated.side.left.air.distribution.middle.and.lower")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    Training2View()
        .environmentObject(FontManager())
}
