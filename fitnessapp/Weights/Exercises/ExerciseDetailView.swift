//
//  ExerciseDetailView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/4/24.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var exercise: Exercise
    
    @State private var editingExercise = Exercise.emptyExercise
    @State private var isPresentingEditView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(url: URL(string: exercise.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                    } else if phase.error != nil {
                        // Error occurred
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                    } else {
                        // Placeholder
                        ProgressView()
                            .frame(width: 250, height: 250)
                    }
                }
                ScrollView {
                    Text(exercise.info)
                        .padding()
                }
            }
            .navigationTitle(exercise.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit", action: {
                        editingExercise = exercise
                        isPresentingEditView = true
                    })
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    ExerciseDetailEditView(exercise: editingExercise)
                        .navigationTitle(exercise.title)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    exercise.title = editingExercise.title
                                    exercise.bodyPart = editingExercise.bodyPart
                                    exercise.imageUrl = editingExercise.imageUrl
                                    exercise.info = editingExercise.info
                                    isPresentingEditView = false
                                }
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    ExerciseDetailView(exercise: Exercise.sampleData[0])
}
