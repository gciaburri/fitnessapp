//
//  WeightsView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI
import SwiftData


struct WeightsView: View {
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
