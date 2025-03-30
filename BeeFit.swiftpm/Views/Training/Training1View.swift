//
//  Training1View.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 20.02.2025.
//

import SwiftUI

struct Training1View: View {
    @EnvironmentObject var fontManager: FontManager
    
    var body: some View {
        VStack {
            Spacer()
            Text("Step 1")
                .font(fontManager.font1)
                .padding()
            
            Text("Make your phone stable. Ideally, you should use a tripod or some kind of stabilizer to get the best experience from using this app.")
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image(systemName: "camera.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            Spacer()
            Spacer()
        }
    }
}
                 
#Preview {
    Training1View()
        .environmentObject(FontManager())
}
