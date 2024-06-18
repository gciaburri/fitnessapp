//
//  ExercisesView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI
import SwiftData

struct ExercisesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var exercises: [Exercise]
    @State private var isPresentingNewExerciseView = false
    
    var body: some View {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                        ExerciseCardView(exercise: exercise)
                            .padding(.vertical, 0)
                            .listRowInsets(EdgeInsets())
                    }
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                Button(action: {
                    isPresentingNewExerciseView = true
                }) {
                    Image(systemName: "plus")
                }
                Button("Add Samples", action: addSamples)
            }
            .sheet(isPresented: $isPresentingNewExerciseView) {
                NavigationStack{
                    ExerciseDetailEditView(exercise: Exercise.emptyExercise, isNewExercise: true)
                        .navigationTitle("New Exercise")
                }
            }
            .listStyle(.plain)
        
    }
    func addSamples() {
        let benchPress = Exercise(title: "Bench Press", imageUrl: "", bodyPart: "Chest", info: "Ex. exercise", category: "Free Weight")
        modelContext.insert(benchPress)
    }
}

//#Preview {
//    ExercisesView(exercises: exercises)
//}
