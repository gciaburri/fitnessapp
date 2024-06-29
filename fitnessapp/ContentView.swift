//
//  ContentView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/17/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.currentWorkout) var currentWorkout

    var body: some View {
        ZStack{
            TabView {
                Group {
                    ResumeWorkoutView(content: WeightsView())
                        .tabItem {
                            Label("Weights", systemImage: "dumbbell.fill")
                        }
                    NutritionView()
                        .tabItem {
                            Label("Nutrition", systemImage: "fork.knife")
                        }
                    RunView()
                        .tabItem {
                            Label("Run", systemImage: "figure.run")
                        }
                }
                .toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            
        }
    }
}


#Preview {
    ContentView()
}
