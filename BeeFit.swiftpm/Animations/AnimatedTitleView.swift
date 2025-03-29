//
//  AnimatedTitleView.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 18.02.2025.
//

import SwiftUI

struct AnimatedTitleView: View {
    @State var show = false
    let title = "BEE Fit"
    private var initialDelays = [0.0, 0.04, 0.012, 0.18, 0.28, 0.35]
    var body: some View {
        ZStack {
            ZStack {
                AnimatedTitle(title: title, color: Color.blue, initialDelay: initialDelays[5], animationType: .spring)
                AnimatedTitle(title: title, color: Color.cyan, initialDelay: initialDelays[4], animationType: .spring)
                AnimatedTitle(title: title, color: Color.mint, initialDelay: initialDelays[3], animationType: .spring)
                AnimatedTitle(title: title, color: Color.indigo, initialDelay: initialDelays[2], animationType: .spring)
                AnimatedTitle(title: title, color: Color.red, initialDelay: initialDelays[1], animationType: .spring)

            }
            AnimatedTitle(title: title, color: Color.yellow, initialDelay: initialDelays[0], animationType: .spring)
        }
    }
}


struct AnimatedTitle: View {
    let title: String
    let color: Color
    let initialDelay: Double
    let animationType: Animation
    @State var scall = false
    @State private var show = false
    private var delayStep = 0.1
    
    @EnvironmentObject var fontManager: FontManager
    
    init(title: String, color: Color, initialDelay: Double, animationType: Animation) {
        self.title = title
        self.color = color
        self.initialDelay = initialDelay
        self.animationType = animationType
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<title.count, id: \.self) { index in
                Text(String(title[title.index(title.startIndex, offsetBy: index)]))
                    .font(fontManager.font3)
                    .opacity(show ? 1 : 0)
                    .offset(y: show ? -30 : 30)
                    .animation(animationType.delay(Double(index) * delayStep + initialDelay), value: show)
                    .foregroundStyle(color)
            }
        }
        .scaleEffect(scall ? 1 : 1.2)
        .onAppear {
            show.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    scall.toggle()
                }
            }
        }
    }
}
