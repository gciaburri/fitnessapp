//
//  ExerciseDetailEditView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/5/24.
//

import SwiftUI

struct ExerciseDetailEditView: View {
    @Binding var exercise: Exercise
    
    
    var body: some View {
        Form {
            Section(header: Text("Edit Exercise")) {
                TextField("Title", text: $exercise.title)
                TextField("Body Part", text: $exercise.bodyPart)
                TextField("Image URL", text: $exercise.imageUrl)
                TextField("Description", text: $exercise.description)
            }
        }
    }
}

#Preview {
    ExerciseDetailEditView(exercise: .constant(Exercise.sampleData[0]))
}
