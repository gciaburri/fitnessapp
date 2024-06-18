//
//  ExerciseDetailView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/4/24.
//

import SwiftUI

struct ExerciseDetailView: View {
    //  @Environment(\.dismiss) private var dismiss
    
    @State private var isPresentingEditView = false
    var exercise: Exercise
    @Environment(\.modelContext) var modelContext

    var body: some View {
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit", action: {
                        isPresentingEditView = true
                    })
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    ExerciseDetailEditView(exercise: exercise, isNewExercise: false)
                        .navigationTitle(exercise.title)
                }
            }
    }
}

#Preview {
    ExerciseDetailView(exercise: Exercise.sampleData[0])
}
