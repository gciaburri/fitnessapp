//
//  fitnessappApp.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/17/24.
//

import SwiftUI
import SwiftData

@main
struct fitnessappApp: App {
    let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: Exercise.self, Workout.self, WorkoutExercise.self, ExerciseSet.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    var body: some Scene {
        WindowGroup {
            ViewCoordinator()
                .modelContainer(modelContainer)

        }
        
    }
}
