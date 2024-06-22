//
//  CurrentWorkoutView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import SwiftUI
import SwiftData

struct CurrentWorkoutView: View {
    @Environment(\.modelContext) var modelContext
    @Query var workouts: [Workout]
    @State private var selectedExercises = Set<UUID>()
    @State private var isSelectingExercises = false
    @Binding var currentWorkout: Workout
    
//    var workout: Workout
    
    var body: some View {
        VStack {
            Text("Current Workout")
            List {
                ForEach(currentWorkout.workoutExercises) { workoutExercise in
                    if let exercise = workoutExercise.exercise {
                        Text(exercise.title)
                            .padding(.vertical, 1)
                    }
                }
            }
            Button(action: {
                isSelectingExercises = true
            }) {
                Text("Select Exercises")
            }
            .sheet(isPresented: $isSelectingExercises, content: {
                NavigationStack {
                    ExerciseSelectionView(selectedExercises: $selectedExercises, currentWorkout: $currentWorkout)
                }
            })
        }
    }
}

//#Preview {
//    CurrentWorkoutView()
//}
