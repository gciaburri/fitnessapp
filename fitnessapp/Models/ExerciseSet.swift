//
//  ExerciseSet.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/18/24.
//

import Foundation
import SwiftData

@Model
class ExerciseSet: Identifiable, Comparable {
    var id: UUID
    let setNumber: Int
    var reps: Int
    var weight: Double
    var date: Date
    
    static func < (lhs: ExerciseSet, rhs: ExerciseSet) -> Bool {
        lhs.date > rhs.date
    }
    
    init(id: UUID = UUID(), setNumber: Int, reps: Int, weight: Double, date: Date = Date()) {
        self.id = id
        self.setNumber = setNumber
        self.reps = reps
        self.weight = weight
        self.date = date
    }
    
    static var emptySet: ExerciseSet {
        ExerciseSet(setNumber: 1, reps: 0, weight: 0)
    }
}
