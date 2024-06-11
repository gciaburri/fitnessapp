//
//  Exercise.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/3/24.
//

import Foundation
import SwiftData

@Model
class Exercise: Equatable {
    let id: UUID
    var title: String
    var imageUrl: String
    var bodyPart: String
    var info: String
    var category: String
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
            return lhs.id == rhs.id
        }
    
    init(id: UUID = UUID(), title: String, imageUrl: String, bodyPart: String, info: String, category: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.bodyPart = bodyPart
        self.info = info
        self.category = category
    }
    
    static var emptyExercise: Exercise {
        Exercise(title: "", imageUrl: "", bodyPart: "", info: "", category: "")
    }
}


extension Exercise {
    static let sampleData: [Exercise] =
    [
        Exercise(title: "Bench Press",
                   imageUrl: "https://ciaburribrand.com/wp-content/uploads/2020/06/Artboard-1-1.png",
                   bodyPart: "Chest",
                   info: "1. Position Lie on your back on a flat bench with your feet flat on the floor or on a stable board if they don't reach the floor. Grip the barbell with an overhand grip that's slightly wider than shoulder-width, with your thumbs wrapped around the bar. The bar should be directly over your shoulders and at arm's length above your upper chest.",
                   category: "Barbell"),
        
        Exercise(title: "Squat",
                   imageUrl: "https://ciaburribrand.com/wp-content/uploads/2020/06/Artboard-1-1.png",
                   bodyPart: "Legs",
                   info: "",
                   category: "Barbell")
    ]
}
