//
//  ExercisesView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct ExercisesView: View {
    @Bindable var exercises: ExercisesViewModel
    @State private var isPresentingNewExerciseView = false
    @State private var showDetail: Bool = false
    @State private var selectedExercise: Exercise? = nil// Optional Exercise
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                if searchResults.isEmpty {
                    Text("No exercises found")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(searchResults, id: \.id) { exercise in
                        Button(action: {
                            selectedExercise = exercise
                        }) {
                            ExerciseCardView(exercise: exercise)
                                .padding(.vertical, 0)
                                .listRowInsets(EdgeInsets())
                        }
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
            }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always))
            .sheet(item: $selectedExercise) { exercise in
                ExerciseDetailView(exercise: exercise)
            }
            .sheet(isPresented: $isPresentingNewExerciseView) {
                NewExerciseSheet(exercises: exercises, isPresentingNewExerciseView: $isPresentingNewExerciseView)
            }
            .listStyle(.plain)
        }
    }
    
    var searchResults: [Exercise] {
        if searchText.isEmpty {
            return exercises.exercises
        } else {
            return exercises.exercises.filter { $0.title.contains(searchText) }
        }
    }
}

#Preview {
    ExercisesView(exercises: ExercisesViewModel(exercises: Exercise.sampleData))
}
