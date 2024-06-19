//
//  CurrentWorkoutView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import SwiftUI

struct CurrentWorkoutView: View {
    @Environment(\.modelContext) var modelContext
    var workout: Workout
    
    var body: some View {
        VStack {
            Text("Current Workout")
            Button(action: {
                workoutExercise = WorkoutExercise(exercise: 
                Workout.workoutExercises.append(WorkoutExercise:
            }) {
                Text("Add Exercise")
            }
        }
    }
}

//#Preview {
//    CurrentWorkoutView()
//}
