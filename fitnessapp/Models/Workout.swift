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
    var completed: Bool = false
    @Relationship(deleteRule: .cascade, inverse: \WorkoutExercise.workout)
    var workoutExercises: [WorkoutExercise] = []

    init(id: UUID = UUID(), title: String, dateCreated: Date = Date(), completed: Bool = false, workoutExercises: [WorkoutExercise] = []) {
        self.id = id
        self.title = title
        self.dateCreated = dateCreated
        self.completed = completed
        self.workoutExercises = workoutExercises
    }
    
    func addExercise(_ workoutExercise: WorkoutExercise, context: ModelContext) {
        workoutExercises.append(workoutExercise)
        context.insert(workoutExercise)
    }
    
    func removeExercise(_ workoutExercise: WorkoutExercise, context: ModelContext) {
        if let index = workoutExercises.firstIndex(where: { $0.id == workoutExercise.id}) {
            workoutExercises.remove(at: index)
            context.delete(workoutExercise)
        }
    }
}
