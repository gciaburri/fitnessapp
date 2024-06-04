//
//  ExerciseDetailView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/4/24.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let exercise: Exercise
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
                    Text(exercise.description)
                        .padding()
                }
            }
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.blue)
            })
            .navigationTitle(exercise.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExerciseDetailView(exercise: Exercise.sampleData[0])
}
