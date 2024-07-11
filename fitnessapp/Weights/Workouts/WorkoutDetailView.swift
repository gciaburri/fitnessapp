//
//  WorkoutDetailView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 7/10/24.
//

import SwiftUI
import SwiftData
struct WorkoutDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    let workout: Workout
    
    var body: some View {
        Text(workout.title)
        VStack(alignment: .leading) {
            Text(workout.dateCreated.formatted(date: .complete, time: .shortened))
            ForEach(workout.workoutExercises, id: \.id) { (workoutExercise: WorkoutExercise) in
                VStack {
                    Text("\(workoutExercise.exercise?.title ?? "Empty")")
                    VStack {
                        ForEach(Array(workoutExercise.sortedSets.enumerated()), id: \.element.id) { index, set in
                            HStack {
                                Text("Set \(index + 1) ")
                                padding()
                                Text("\(set.weight)lbs x \(set.reps)")
                            }
                        }
                    }
                }
            }
            
        }
    }
}

//#Preview {
//    WorkoutDetailView()
//}
