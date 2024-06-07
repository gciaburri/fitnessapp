//
//  NewExerciseSheet.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import SwiftUI

struct NewExerciseSheet: View {
    @State private var newExercise = Exercise.emptyExercise
    @Bindable var exercises: ExercisesViewModel
    @Binding var isPresentingNewExerciseView: Bool
    
    var body: some View {
        NavigationStack {
            ExerciseDetailEditView(exercise: $newExercise)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewExerciseView = false
                        }
                        .foregroundColor(.blue)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            exercises.exercises.append(newExercise)
                            isPresentingNewExerciseView = false
                        }
                        .foregroundColor(.blue)
                    }
                }
        }
    }
}

#Preview {
    NewExerciseSheet(exercises: ExercisesViewModel(exercises: Exercise.sampleData), isPresentingNewExerciseView: .constant(true))
}
