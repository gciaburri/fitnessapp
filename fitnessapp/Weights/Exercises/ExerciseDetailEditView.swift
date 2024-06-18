//
//  ExerciseDetailEditView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/5/24.
//

import SwiftUI
import SwiftData

struct ExerciseDetailEditView: View {
    @Environment(\.dismiss) var dismiss
    var exercise: Exercise
    @Environment(\.modelContext) var modelContext
    @State private var editedExercise: Exercise
    var isNewExercise: Bool
    
    init(exercise: Exercise, isNewExercise: Bool = false) {
        self.exercise = exercise
        self._editedExercise = State(initialValue: exercise.copy())
        self.isNewExercise = isNewExercise
    }
    
    var body: some View {
        Form {
            Section(header: Text(isNewExercise ? "New Exercise" : "Edit Exercise")) {
                TextField("Title", text: $editedExercise.title)
                TextField("Body Part", text: $editedExercise.bodyPart)
                TextField("Image URL", text: $editedExercise.imageUrl)
                TextField("Description", text: $editedExercise.info)
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Discard") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(isNewExercise ? "Add" : "Save") {
                    saveChanges()
                    dismiss()
                }
                .disabled(!isValidExercise)
            }
        }
        
    }
    private var isValidExercise: Bool {
        !editedExercise.title.isEmpty && !editedExercise.bodyPart.isEmpty
    }
    
    private func saveChanges() {
        if isNewExercise {
            modelContext.insert(editedExercise)
        } else {
            exercise.title = editedExercise.title
            exercise.title = editedExercise.title
            exercise.title = editedExercise.title
            exercise.title = editedExercise.title
        }
        try? modelContext.save()
    }
    
}

extension Exercise {
    func copy() -> Exercise {
        return Exercise(id: self.id, title: self.title, imageUrl: self.imageUrl, bodyPart: self.bodyPart, info: self.info, category: self.category)
    }
}


//#Preview {
//    ExerciseDetailEditView(exercise: .constant(Exercise.sampleData[0]))
//}

