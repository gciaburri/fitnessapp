//
//  fitnessappApp.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/17/24.
//

import SwiftUI

@main
struct fitnessappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
