//
//  CompletionView.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 19.02.2025.
//

import SwiftUI

struct CompletionView: View {
    @State private var isCompleted = false
    @State private var showDoneSign = false
    @State private var showRays = false
    
    let rayLength: CGFloat = 30
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 150)
                .foregroundColor(.gray)
                .overlay(
                    Circle()
                        .trim(from: 0, to: isCompleted ? 1 : 0)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 1.2), value: isCompleted)
                )
            
            ForEach(0..<12) { index in
                Rectangle()
                    .frame(width: 3, height: rayLength)
                    .foregroundColor(.green)
                    .cornerRadius(2)
                    .offset(y: -110)
                    .rotationEffect(.degrees(Double(index) * (360.0 / Double(12))))
                    .scaleEffect(showRays ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 0.5).delay(Double(index) * 0.1), value: showRays)
            }
            
            
            if showDoneSign {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.green)
                    .frame(width: 60, height: 60)
                    .transition(.scale)
            }
        }
        .onAppear {
            isCompleted = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    showRays = true
                    showDoneSign = true
                }
            }
        }
    }
}

#Preview {
    CompletionView()
}
