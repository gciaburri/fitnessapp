//
//  ExercisesView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct ExercisesView: View {
    let exercises: [Exercise]
    @State private var selectedExercise: Exercise? // Optional Exercise
    @State private var showingDetail = false
    
    var body: some View {
        NavigationStack {
            List(exercises, id: \.title) { exercise in
                Button(action: {
                    selectedExercise = exercise
                    showingDetail = true
                }) {
                    ExerciseCardView(exercise: exercise)
                        .padding(.vertical, 0)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
        .navigationTitle("Exercises")
        .sheet(isPresented: $showingDetail) {
            if let selectedExercise = selectedExercise {
                ExerciseDetailView(exercise: selectedExercise)
            }
        }
    }
}

#Preview {
    ExercisesView(exercises: Exercise.sampleData)
}
