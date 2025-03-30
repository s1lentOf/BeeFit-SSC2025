//
//  User.swift
//  BeeFit
//
//  Created by Ігор Іванченко on 18.02.2025.
//

import SwiftUI

class User: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 18
    @Published var gender: String = "" {
        didSet {
            setExercises()
        }
    }
    
    @Published var squats: Int = 0
    @Published var doneSquats: Int = 0
    
    @Published var pushUps: Int = 0
    @Published var donePushUps: Int = 0
    
    @Published var defaultLevels: [Level] = []
    
    init() {
        setExercises()
    }
    
    private func setExercises() {
        defaultLevels.removeAll()
        
        if gender == "Male" {
            pushUps = 10
            squats = 15
            defaultLevels = [
                Level(id: 0, repsNeeded: 3),
                Level(id: 1, repsNeeded: 7),
                Level(id: 2, repsNeeded: 3),
                Level(id: 3, repsNeeded: 8),
                Level(id: 4, repsNeeded: 4)
            ]
        } else {
            pushUps = 5
            squats = 10
            defaultLevels = [
                Level(id: 0, repsNeeded: 3),
                Level(id: 1, repsNeeded: 2),
                Level(id: 2, repsNeeded: 3),
                Level(id: 3, repsNeeded: 3),
                Level(id: 4, repsNeeded: 4)
            ]
        }
    }
}
