//
//  StartWorkoutView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import SwiftUI
import SwiftData
struct StartWorkoutView: View {
    @Environment(\.modelContext) var modelContext
    @Query var workouts: [Workout]
    @State var currentWorkout: Workout?
    @State private var showingWorkout = false

    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Start Workout")
                Button(action: {
                    if let existingWorkout = workouts.first(where: { !$0.completed}) {
                        currentWorkout = existingWorkout
                    } else {
                        let newWorkout = Workout(title: "New Workout")
                        addNewWorkout(newWorkout: newWorkout)
                    }
                    showingWorkout = true
                }) {
                    Text("Start New Workout")
                }
                .sheet(isPresented: $showingWorkout) {
                    NavigationStack {
                        CurrentWorkoutView(currentWorkout: $currentWorkout)
                    }
                    .presentationDetents([.height(100), .large])
                }
                
                NavigationLink {
                    WorkoutsView()
                } label: {
                    Text("View Workouts")
                }
            }
        }
    }
    func addNewWorkout(newWorkout: Workout) {
        let newWorkout = Workout(title: "New Workout")
        modelContext.insert(newWorkout)
        currentWorkout = newWorkout
    }
}

//#Preview {
//    StartWorkoutView()
//}
