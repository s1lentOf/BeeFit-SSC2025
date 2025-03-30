//
//  TypingEffect.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 15.02.2025.
//

import SwiftUI

struct TypingEffect: View {
    @State private var displayedText = ""
    var fullText: String
    @Binding var isExpanded: Bool
    @State private var hasTyped = false
    @EnvironmentObject var fontManager: FontManager
    
    var body: some View {
        Text(displayedText)
            .font(fontManager.font2)
            .frame(width: 300, height: 150, alignment: .topLeading)
            .multilineTextAlignment(.center)
            .onAppear {
                if isExpanded && !hasTyped {
                    startTypingEffect()
                }
            }
            .onChange(of: isExpanded) { _, newValue in
                if newValue && !hasTyped {
                    startTypingEffect()
                }
            }
    }
    
    func startTypingEffect() {
        displayedText = ""
        hasTyped = true
        Task {
            try await Task.sleep(for: .seconds(0.5))
            for (_, char) in fullText.enumerated() {
                try await Task.sleep(for: .milliseconds(30))
                DispatchQueue.main.async {
                    displayedText.append(char)
                }
            }
        }
    }
}

#Preview {
    TypingEffect(fullText: "Hello world", isExpanded: .constant(true))
}
