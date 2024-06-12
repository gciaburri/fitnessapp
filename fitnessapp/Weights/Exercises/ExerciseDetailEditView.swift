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
    @Bindable var exercise: Exercise
    var modelContext: ModelContext
    
    init(exerciseID: PersistentIdentifier, in container: ModelContainer) {
        modelContext = ModelContext(container)
        modelContext.autosaveEnabled = false
        exercise = modelContext.model(for: exerciseID) as? Exercise ?? Exercise(title: "New Exercise", imageUrl: "", bodyPart: "", info: "", category: "")
    }
    
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Edit Exercise")) {
                    TextField("Title", text: $exercise.title)
                    TextField("Body Part", text: $exercise.bodyPart)
                    TextField("Image URL", text: $exercise.imageUrl)
                    TextField("Description", text: $exercise.info)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Discard") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    try? modelContext.save()
                    dismiss()
                }
            }
        }
    }
}

//#Preview {
//    ExerciseDetailEditView(exercise: .constant(Exercise.sampleData[0]))
//}

