//
//  WorkoutsView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import SwiftUI
import SwiftData

struct WorkoutsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var workouts: [Workout]
    @State private var selectedWorkout: Workout? = nil
    @State private var isShowingPopup = false

    var body: some View {
        List {
            ForEach(workouts.filter {$0.completed}, id: \.self) { workout in
                Button(action: {
                    selectedWorkout = workout
                    isShowingPopup = true
                }) {
                    WorkoutCardView(workout: workout)
                }
            }.onDelete(perform: removeWorkout)
        }
        if isShowingPopup, let workout = selectedWorkout {
            Popup(isPresented: $isShowingPopup) {
                WorkoutDetailView(workout: workout)
            }
        }
    }
    func removeWorkout(at offsets: IndexSet) {
        for offset in offsets {
            let workout = workouts[offset]
            modelContext.delete(workout)
        }
    }
}

//#Preview {
//    WorkoutsView()
//}
