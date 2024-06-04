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
            
        }
    }
}

#Preview {
    ExerciseDetailView(exercise: Exercise.sampleData[0])
}
