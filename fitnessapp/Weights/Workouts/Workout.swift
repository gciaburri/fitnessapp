//
//  Workout.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/7/24.
//

import Foundation
import SwiftData

@Model
class Workout {
    let id: UUID
    var title: String
    var dateCreated: Date
    var workoutExercises: [WorkoutExercise]
    
    init(id: UUID = UUID(), title: String, dateCreated: Date = Date(), workoutExercises: [WorkoutExercise] = []) {
        self.id = id
        self.title = title
        self.dateCreated = dateCreated
        self.workoutExercises = workoutExercises
    }
    
    func addExercise(_ set: WorkoutExercise) {
        workoutExercises.append(set)
    }
    
    func removeExercise(_ set: WorkoutExercise) {
        if let index = workoutExercises.firstIndex(where: { $0.id == set.id}) {
            workoutExercises.remove(at: index)
        }
    }
}
