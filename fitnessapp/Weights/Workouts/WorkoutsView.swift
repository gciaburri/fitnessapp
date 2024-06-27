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
            ForEach(workouts) { workout in
                WorkoutCardView(workout: workout)
            }
        }
    }
}

#Preview {
    WorkoutsView()
}
