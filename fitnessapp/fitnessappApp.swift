//
//  fitnessappApp.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/17/24.
//

import SwiftUI
import SwiftData

@main
struct fitnessappApp: App {

    var body: some Scene {
        WindowGroup {
            ViewCoordinator()
        }
        .modelContainer(for: Exercise.self)
    }
}
