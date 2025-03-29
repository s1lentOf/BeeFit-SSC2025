//
//  Level.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 15.02.2025.
//

import Foundation

struct Level: Identifiable {
    var id: Int
    var repsNeeded: Int
    var doneReps: Int = 0
    
    var isDone: Bool {
        repsNeeded <= doneReps
    }
        
    static func ==(lhs: Level, rhs: Level) -> Bool { return lhs.id == rhs.id }
}
