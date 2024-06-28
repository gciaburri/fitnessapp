//
//  ExerciseSetView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/25/24.
//

import SwiftUI

struct ExerciseSetView: View {
    @State var exerciseSet: ExerciseSet
    @Binding var workoutExercise: WorkoutExercise
    
    var body: some View {
        HStack {
            Text("\(exerciseSet.setNumber)")
                .frame(maxWidth: .infinity)
            Text("prev")
                .frame(maxWidth: .infinity)
            TextField("lbs", value: $exerciseSet.weight, format: .number)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)

            TextField("Reps", value: $exerciseSet.reps, format: .number)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)

            Image(systemName: "checkmark.rectangle.fill")
                .frame(maxWidth: .infinity)
        }
    }
}

//#Preview {
//    ExerciseSetView()
//}
