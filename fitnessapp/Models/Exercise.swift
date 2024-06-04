//
//  Exercise.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/3/24.
//

import Foundation

struct Exercise: Identifiable{
    let id = UUID()
    var title: String
    var imageUrl: String
    var bodyParts: [String]
    var description: String
    var category: String
}


extension Exercise {
    static let sampleData: [Exercise] =
    [
        Exercise(title: "Bench Press",
                   imageUrl: "https://ciaburribrand.com/wp-content/uploads/2020/06/Artboard-1-1.png",
                   bodyParts: ["Chest", "Triceps", "Shoulders"],
                   description: "",
                   category: "Barbell"),
        
        Exercise(title: "Squat",
                   imageUrl: "https://ciaburribrand.com/wp-content/uploads/2020/06/Artboard-1-1.png",
                   bodyParts: ["Legs"],
                   description: "",
                   category: "Barbell")
    ]
}
