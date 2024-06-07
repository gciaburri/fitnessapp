//
//  StartWorkoutView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/6/24.
//

import SwiftUI

struct StartWorkoutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Start Workout")
                NavigationLink {
                    CurrentWorkoutView()
                } label: {
                    Text("Start New Workout")
                }
            }
        }
    }
}

#Preview {
    StartWorkoutView()
}
