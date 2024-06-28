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
    @State private var selectedExercises = Set<UUID>()
    @State private var isSelectingExercises = false
    @Binding var currentWorkout: Workout?
    
    var body: some View {
        if let currentWorkout = currentWorkout {
            VStack {
                Text("Current Workout")
                    .font(.headline)
                    .padding()
                List {
                    ForEach(currentWorkout.workoutExercises) { workoutExercise in
                        WorkoutExerciseView(workoutExercise: workoutExercise)
                    }
                }
                .listStyle(.plain)
                
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
        } else {
            Text("No current workout")
        }
    }
}

//#Preview {
//    CurrentWorkoutView()
//}
