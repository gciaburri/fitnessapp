//
//  ContentView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/17/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            WeightsView()
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
    }
}


#Preview {
    ContentView()
}
