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
    let id: UUID
    var reps: Int
    var weight: Double
    var exercise: Exercise
    
    init(id: UUID = UUID(), reps: Int, weight: Double, exercise: Exercise) {
        self.id = id
        self.reps = reps
        self.weight = weight
        self.exercise = exercise
    }
}
