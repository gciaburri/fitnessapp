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
    
//    var workout: Workout
    
    var body: some View {
        VStack {
            Text("Current Workout")
            NavigationLink("Select Exercises") {
                ExerciseSelectionView(selectedExercises: $selectedExercises)
            }
        }
    }
}

//#Preview {
//    CurrentWorkoutView()
//}
