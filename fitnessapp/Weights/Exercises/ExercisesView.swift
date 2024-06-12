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
    @State private var path = [Exercise]()
//    @Bindable var exercises: ExercisesViewModel
    @State private var isPresentingNewExerciseView = false
    @State private var showDetail: Bool = false
    @State private var selectedExercise: Exercise? = nil// Optional Exercise
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(exercises, id: \.id) { exercise in
                    Button(action: {
                        selectedExercise = exercise
                    }) {
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
            .sheet(item: $selectedExercise) { exercise in
                ExerciseDetailView(exercise: exercise)
            }
//            .sheet(isPresented: $isPresentingNewExerciseView) {
//                NewExerciseSheet(isPresentingNewExerciseView: $isPresentingNewExerciseView)
//            }
            .listStyle(.plain)
        }
    }
    func addSamples() {
        let benchPress = Exercise(title: "Bench Press", imageUrl: "", bodyPart: "Chest", info: "Ex. exercise", category: "Free Weight")
        modelContext.insert(benchPress)
    }
}

//#Preview {
//    ExercisesView(exercises: exercises)
//}
