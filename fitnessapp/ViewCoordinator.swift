//
//  ViewCoordinator.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        }else {
            SplashScreenView(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
