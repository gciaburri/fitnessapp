//
//  ExerciseSet.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/18/24.
//

import Foundation
import SwiftData

@Model
class ExerciseSet: Identifiable {
    let setNumber: Int
    var reps: Int
    var weight: Double
    
    
    init(setNumber: Int, reps: Int, weight: Double) {
        self.setNumber = setNumber
        self.reps = reps
        self.weight = weight
    }
    
    static var emptySet: ExerciseSet {
        ExerciseSet(setNumber: 1, reps: 0, weight: 0)
    }
}
