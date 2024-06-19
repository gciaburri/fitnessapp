//
//  WorkoutExercise.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/19/24.
//

import Foundation
import SwiftData

@Model
class WorkoutExercise: Identifiable {
    var id: UUID
    var exercise: Exercise?
    var workout: Workout?
    var sets: [ExerciseSet] = [ExerciseSet]()
    
    init(id: UUID = UUID(), exercise: Exercise, sets: [ExerciseSet] = []) {
        self.id = id
        self.exercise = exercise
        self.sets = sets
    }
}
