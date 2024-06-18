//
//  Workout.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/7/24.
//

import Foundation
import SwiftData

class Workout {
    let id: UUID
    var title: String
    var dateCreated: Date
    var exerciseSets: [ExerciseSet]
    
    init(id: UUID = UUID(), title: String, dateCreated: Date = Date(), exerciseSets: [ExerciseSet] = []) {
        self.id = id
        self.title = title
        self.dateCreated = dateCreated
        self.exerciseSets = exerciseSets
    }
    
    func addSet(_ set: ExerciseSet) {
        exerciseSets.append(set)
    }
    
    func removeSet(_ set: ExerciseSet) {
        if let index = exerciseSets.firstIndex(where: { $0.id == set.id}) {
            exerciseSets.remove(at: index)
        }
    }
}
