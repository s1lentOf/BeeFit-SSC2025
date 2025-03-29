//
//  LevelsProgressView.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 15.02.2025.
//

import SwiftUI
struct LevelsProgressView: View {
    @Binding var levels: [Level]
    @Binding var selectedLevel: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(levels.indices, id: \.self) { index in
                    LevelView(
                        level: $levels[index],
                        isLast: index == levels.count - 1,
                        selectedLevel: $selectedLevel
                    )
                }
            }
        }
    }
}
