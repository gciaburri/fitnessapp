//
//  WorkoutExerciseView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/25/24.
//

import SwiftUI

struct WorkoutExerciseView: View {
    @Environment(\.modelContext) var modelContext
    @State var workoutExercise: WorkoutExercise
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
            ForEach(workoutExercise.sortedSets) {set in
                        ExerciseSetView(exerciseSet: set)
                            .padding(.vertical, 3)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .listRowSeparator(.hidden)
                
                Text("test")
            Button(action: {workoutExercise.addSet()}) {
                    Text("Add Set")
                }
                .padding(.top)
                .buttonStyle(.plain)
            

        }
    }
}

//#Preview {
//    WorkoutExerciseView()
//}
