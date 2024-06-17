//
//  NewExerciseSheet.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

//import SwiftUI
//
//struct NewExerciseSheet: View {
//    @Environment(\.modelContext) var modelContext
//    @State private var newExercise = Exercise.emptyExercise
//    @Binding var isPresentingNewExerciseView: Bool
//    
//    var body: some View {
//        NavigationStack {
//            ExerciseDetailEditView()
//                .toolbar {
//                    ToolbarItem(placement: .cancellationAction) {
//                        Button("Dismiss") {
//                            isPresentingNewExerciseView = false
//                        }
//                        .foregroundColor(.blue)
//                    }
//                    ToolbarItem(placement: .confirmationAction) {
//                        Button("Add") {
//                            modelContext.insert(newExercise)
//                            isPresentingNewExerciseView = false
//                        }
//                        .foregroundColor(.blue)
//                    }
//                    
//                }
//        }
//    }
//}
//
////#Preview {
////    NewExerciseSheet(exercises: ExercisesViewModel(exercises: Exercise.sampleData), isPresentingNewExerciseView: .constant(true))
////}
