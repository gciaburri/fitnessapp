//
//  ExercisesViewModel.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import Foundation

@Observable
class ExercisesViewModel {
    var exercises: [Exercise]
    
    init(exercises: [Exercise]) {
        self.exercises = exercises
    }
}
