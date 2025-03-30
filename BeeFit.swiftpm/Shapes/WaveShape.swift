//
//  WaveShape.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 19.02.2025.
//

import SwiftUI

struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: 10, y: 40))
        path.addLine(to: CGPoint(x: 27, y: 40))
        path.addLine(to: CGPoint(x: 37, y: 67))
        path.addLine(to: CGPoint(x: 62, y: 13))
        path.addLine(to: CGPoint(x: 70, y: 41))
        path.addLine(to: CGPoint(x: 86, y: 41))
        return path
    }
}

