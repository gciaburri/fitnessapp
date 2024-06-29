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
    @Environment(\.currentWorkout) var currentWorkout
    @State private var showingWorkout = false

    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Start Workout")
                Button(action: {
                    if let existingWorkout = workouts.first(where: { !$0.completed}) {
                        currentWorkout.wrappedValue = existingWorkout
                    } else {
                        let newWorkout = Workout(title: "New Workout")
                        addNewWorkout(newWorkout: newWorkout)
                    }
                    showingWorkout = true
                }) {
                    Text("Start New Workout")
                }
                .sheet(isPresented: $showingWorkout) {
                    if let _ = currentWorkout.wrappedValue {
                        NavigationStack {
                            CurrentWorkoutView(currentWorkout: currentWorkout)
                        }
                    }
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
        currentWorkout.wrappedValue = newWorkout
    }
}

//#Preview {
//    StartWorkoutView()
//}
