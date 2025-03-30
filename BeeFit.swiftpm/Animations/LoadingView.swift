//
//  LoadingView.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 19.02.2025.
//

import SwiftUI

struct LoadingView: View {
    @State private var startTrim: CGFloat = 0
    @State private var endTrim: CGFloat = 0

    var body: some View {
        ZStack {
            WaveShape()
                .stroke(Color.yellow.opacity(0.3), lineWidth: 3)

            WaveShape()
                .trim(from: startTrim, to: endTrim)
                .stroke(Color.yellow, lineWidth: 3)

        }
        .frame(width: 100, height: 100)
        .scaleEffect(1.5)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.5) .repeatForever(autoreverses: false)) {
                startTrim = 1
                endTrim = 1.4
            }
        }
    }
}

#Preview {
    LoadingView()
}
