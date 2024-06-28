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
    
    init(id: UUID = UUID(), exercise: Exercise, sets: [ExerciseSet] = [ExerciseSet.emptySet]) {
        self.id = id
        self.exercise = exercise
        self.sets = sets
    }
    func addSet(context: ModelContext) {
        let newSet = ExerciseSet(setNumber: self.sets.count + 1, reps: 0, weight: 0)
        self.sets.append(newSet)
        context.insert(newSet)
        
    }
    var sortedSets: [ExerciseSet] {
        get {
            sets.sorted(by: {$0.setNumber < $1.setNumber})
        } set {
            sets = newValue
        }
    }
    var bestSet: ExerciseSet {
        return sets.max {$1.weight > $0.weight} ?? ExerciseSet.emptySet
    }
}
