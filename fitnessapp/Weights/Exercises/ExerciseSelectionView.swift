//
//  ExerciseSelectionView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/20/24.
//

import SwiftUI
import SwiftData

struct ExerciseSelectionView: View {
    @Environment(\.modelContext) var modelContext
    @Query var exercises: [Exercise]
    @Binding var selectedExercises: Set<UUID>
    
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
                        .padding(.vertical, 0)
                        .listRowInsets(EdgeInsets())
                
            }
        }
    }
}

//#Preview {
//    ExerciseSelectionView()
//}
