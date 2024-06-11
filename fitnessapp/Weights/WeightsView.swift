//
//  WeightsView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI
import SwiftData

struct WeightsView: View {
    @Environment(\.modelContext) private var context
//    @State private var exercises = ExercisesViewModel(exercises: Exercise.sampleData)
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Exercises") {
                    ExercisesView()
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
