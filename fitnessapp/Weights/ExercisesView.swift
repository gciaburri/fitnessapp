//
//  ExercisesView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct ExercisesView: View {
    let exercises: [Exercise]
    
    var body: some View {
        NavigationStack {
            List(exercises, id: \.title) { exercise in
                NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                    ExerciseCardView(exercise: exercise)
                        .padding(.vertical, 0)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
        .navigationTitle("Exercises")
        

    }
}

#Preview {
    ExercisesView(exercises: Exercise.sampleData)
}
