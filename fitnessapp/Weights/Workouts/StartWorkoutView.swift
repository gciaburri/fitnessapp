//
//  StartWorkoutView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import SwiftUI
import SwiftData
struct StartWorkoutView: View {
    @Query var workouts: [Workout]
    @State var currentWorkout = Workout(title: "New Workout")
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Start Workout")
                NavigationLink {
                    CurrentWorkoutView(currentWorkout: $currentWorkout)
                } label: {
                    Text("Start New Workout")
                }
            }
        }
    }
}

//#Preview {
//    StartWorkoutView()
//}
