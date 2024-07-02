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
    @Environment(\.dismiss) var dismiss
    
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
                HStack {
                    Spacer()
                    Button(action: {
                        isSelectingExercises = true
                    }) {
                        Text("Add Exercises")
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            
            .sheet(isPresented: $isSelectingExercises, content: {
                NavigationStack {
                    ExerciseSelectionView(selectedExercises: $selectedExercises, currentWorkout: $currentWorkout)
                }
            })
            if currentWorkout.workoutExercises.isEmpty {
                Button(action: {
                    modelContext.delete(currentWorkout)
                    self.currentWorkout = nil
                    dismiss()
                }) {
                    Text("Cancel Workout")
                }
            } else {
                Button(action: {
                    currentWorkout.completed = true
                    self.currentWorkout = nil
                    dismiss()
                }) {
                    Text("Finish Workout")
                }
            }
        }
        } else {
            Text("No current workout")
        }
    }
}

//#Preview {
//    CurrentWorkoutView()
//}
