//
//  WorkoutExerciseView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/25/24.
//

import SwiftUI

struct WorkoutExerciseView: View {
    var workoutExercise: WorkoutExercise
    let setNumber = 0

    var body: some View {
        VStack {
            HStack {
                Text(workoutExercise.exercise?.title ?? "Empty")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.vertical, 1)
            HStack {
                Text("Set")
                    .frame(maxWidth: .infinity)
                Text("Previous")
                    .frame(maxWidth: .infinity)
                Text("lbs")
                    .frame(maxWidth: .infinity)
                Text("Reps")
                    .frame(maxWidth: .infinity)
                Image(systemName: "checkmark.rectangle.fill")
                    .frame(maxWidth: .infinity)
            }
            ForEach(workoutExercise.sets) {set in
                ExerciseSetView(exerciseSet: set)
            }
            Button(action: {
                let newSetNumber = (workoutExercise.sets.last?.setNumber ?? 0) + 1
                let newSet = ExerciseSet(setNumber: newSetNumber, reps: 0, weight: 0)
                workoutExercise.sets.append(newSet)
            }) {
                Text("Add Set")
            }
        }
    }
}

//#Preview {
//    WorkoutExerciseView()
//}
