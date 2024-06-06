//
//  WeightsView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct WeightsView: View {
    @State private var exercises = Exercise.sampleData
    var body: some View {
        NavigationStack {
            ExercisesView(exercises: $exercises)
        }
    }
}

#Preview {
    WeightsView()
}
