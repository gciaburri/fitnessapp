//
//  WorkoutCardView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/26/24.
//

import SwiftUI

struct WorkoutCardView: View {
    let workout: Workout
    var body: some View {
        VStack {
            HStack {
                Text(workout.title)
                Spacer()
                Image(systemName: "ellipsis")
            }
            Text(workout.dateCreated, style: .date)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Exercise")
                Spacer()
                Text("Best Set")
            }
            .frame(maxWidth: .infinity)

            HStack {
                VStack(alignment: .leading) {
                    ForEach(workout.workoutExercises) { workoutExercise in
                        let bestWeightString = workoutExercise.bestSet.weight.formatted(.number.precision(.fractionLength(2)))
                        HStack {
                            Text("\(workoutExercise.sets.count) x \(workoutExercise.exercise?.title ?? "Empty")")
                                .font(.footnote)
                            Spacer()
                            Text("\(bestWeightString)lbs x \(workoutExercise.bestSet.reps)")
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}

//#Preview {
//    WorkoutCardView()
//}
