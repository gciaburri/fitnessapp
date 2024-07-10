//
//  ViewCoordinator.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI
import SwiftData

struct ViewCoordinator: View {
    @State private var isActive = false
    @Binding var currentWorkout: Workout?
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        if isActive {
            ContentView()
                .environment(\.currentWorkout, $currentWorkout)
                
        }else {
            SplashScreenView(isActive: $isActive)
                .onAppear{
                    loadCurrentWorkout()
                }
        }
    }
    private func loadCurrentWorkout() {
        let fetchDescriptor = FetchDescriptor<Workout>(
            predicate: #Predicate {$0.completed == false},
            sortBy: [SortDescriptor(\.dateCreated, order: .reverse)]
        )
        do {
            let incompleteWorkouts = try modelContext.fetch(fetchDescriptor)
            currentWorkout = incompleteWorkouts.first
            print("Current workout loaded: \(currentWorkout?.title ?? "None")")
        } catch {
            print("Failed to fetch current workout: \(error)")
        }
    }
}

//#Preview {
//    ViewCoordinator()
//}
