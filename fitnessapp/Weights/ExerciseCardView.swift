//
//  ExerciseCardView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/3/24.
//

import SwiftUI

struct ExerciseCardView: View {
    let exercise: Exercise
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: exercise.imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                } else if phase.error != nil {
                    // Error occurred
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                } else {
                    // Placeholder
                    ProgressView()
                        .frame(width: 80, height: 80)
                }
            }
            
            VStack {
                Text(exercise.title)
                Spacer()
                Text(exercise.bodyParts[0])
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 80)) {
    ExerciseCardView(exercise: Exercise.sampleData[0])
}
