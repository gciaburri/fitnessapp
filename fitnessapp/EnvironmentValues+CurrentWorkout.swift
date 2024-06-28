//
//  EnvironmentValues+CurrentWorkout.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/27/24.
//

import Foundation
import SwiftUI

private struct CurrentWorkoutKey: EnvironmentKey {
    static let defaultValue: Binding<Workout?> = .constant(nil)
}

extension EnvironmentValues {
    var currentWorkout: Binding<Workout?> {
        get { self[CurrentWorkoutKey.self] }
        set { self[CurrentWorkoutKey.self] = newValue }
    }
}
