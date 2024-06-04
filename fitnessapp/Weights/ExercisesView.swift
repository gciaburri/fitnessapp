//
//  ExercisesView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct ExercisesView: View {
    let exercises: [Exercise]
    
    var body: some View {
        List(exercises, id: \.title) { exercise in
            ExerciseCardView(exercise: exercise)
                .padding(.vertical, 0)
                .listRowInsets(EdgeInsets())
        }
    }
}

#Preview {
    ExercisesView(exercises: Exercise.sampleData)
}
