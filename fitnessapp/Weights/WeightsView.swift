//
//  WeightsView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct WeightsView: View {
    @State private var exercises = ExercisesViewModel(exercises: Exercise.sampleData)
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Exercises") {
                    ExercisesView(exercises: exercises)
                }
                NavigationLink("Workout") {
                    StartWorkoutView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    WeightsView()
}
