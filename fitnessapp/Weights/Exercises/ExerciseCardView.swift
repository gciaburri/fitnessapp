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
            Text("").frame(maxWidth: 0) // empty text so that divider extends from edge to edge
            AsyncImage(url: URL(string: exercise.imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                } else if phase.error != nil {
                    // Error occurred
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                } else {
                    // Placeholder
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
            VStack(alignment: .leading) {
                Text(exercise.title)
                    .font(.headline.bold())
                Text(exercise.bodyPart)
                    .font(.footnote)
            }
            .padding(.leading, 5)
            Spacer()
        }
        .padding(.horizontal, 0)
        .background(Color.white)
    }
}

#Preview(traits: .defaultLayout) {
    ExerciseCardView(exercise: Exercise.sampleData[0])
}
