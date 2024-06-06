//
//  ExercisesView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct ExercisesView: View {
    @Binding var exercises: [Exercise]
    @State private var selectedExercise: Exercise? = nil// Optional Exercise
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List($exercises) { $exercise in
                if searchResults.isEmpty {
                    Text("No exercises found")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(searchResults, id: \.title) { exercise in
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
                Button(action: {}) {
                    Image(systemName: "plus")
                }
            }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always))
            .sheet(item: $selectedExercise) { exercise in
                ExerciseDetailView(exercise: exercise)
            }
            .listStyle(.plain)
        }
    }
    
    var searchResults: [Exercise] {
        if searchText.isEmpty {
            return exercises
        } else {
            return exercises.filter { $0.title.contains(searchText) }
        }
    }
}

#Preview {
    ExercisesView(exercises: .constant(Exercise.sampleData))
}
