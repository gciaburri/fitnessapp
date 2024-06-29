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

    var body: some View {
        List {
            ForEach(workouts.filter {$0.completed}, id: \.self) { workout in
                WorkoutCardView(workout: workout)
            }.onDelete(perform: removeWorkout)
        }
    }
    func removeWorkout(at offsets: IndexSet) {
        for offset in offsets {
            let workout = workouts[offset]
            modelContext.delete(workout)
        }
    }
}

#Preview {
    WorkoutsView()
}
