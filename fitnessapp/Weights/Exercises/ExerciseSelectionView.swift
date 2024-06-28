//
//  ExerciseSelectionView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/20/24.
//

import SwiftUI
import SwiftData

struct ExerciseSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var exercises: [Exercise]
    @Binding var selectedExercises: Set<UUID>
    @Binding var currentWorkout: Workout?
    
    var body: some View {
        List {
            ForEach(exercises) { exercise in
                ExerciseCardSelectView(exercise: exercise, isSelected: selectedExercises.contains(exercise.id)) {
                    if selectedExercises.contains(exercise.id) {
                        selectedExercises.remove(exercise.id)
                    } else {
                        selectedExercises.insert(exercise.id)
                    }
                    
                }
                .listRowBackground(selectedExercises.contains(exercise.id) ? Color.accentColor.opacity(0.1) : nil)
                .padding(.vertical, 1)
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    selectedExercises.removeAll()
                    dismiss()
                }) {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    addSelectedExercisesToWorkout(context: modelContext)
                    dismiss()
                }) {
                    Text("Done")
                }
            }
        }
    }
    
    private func addSelectedExercisesToWorkout(context: ModelContext) {
        let selectedExercisesList = exercises.filter { selectedExercises.contains($0.id) }
        for exercise in selectedExercisesList {
            let workoutExercise = WorkoutExercise(exercise: exercise)
            currentWorkout!.workoutExercises.append(workoutExercise)
            modelContext.insert(workoutExercise)
        }
    }
}


//#Preview {
//    ExerciseSelectionView()
//}
