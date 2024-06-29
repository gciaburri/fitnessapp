//
//  ViewCoordinator.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    @State var currentWorkout: Workout? = nil
    
    var body: some View {
        if isActive {
            ContentView()
                .environment(\.currentWorkout, $currentWorkout)
        }else {
            SplashScreenView(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
