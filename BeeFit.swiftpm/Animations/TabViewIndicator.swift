//
//  TabViewIndicator.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 20.02.2025.
//

import SwiftUI

struct TabViewIndicator: View {
    let count: Int
    let selected: Int
    
    var body: some View {
        HStack {
            ForEach(1...count, id: \.self) { index in
                Capsule()
                    .fill(index == selected ? Color.primary : Color.gray.opacity(0.4))
                    .frame(width: index == selected ? 25 : 10, height: 10)
                    .animation(.easeInOut(duration: 0.3), value: selected)

            }
        }
    }
}
