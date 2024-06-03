//
//  Exercise.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 6/3/24.
//

import Foundation

struct Exercise {
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
                   imageUrl: "https://ciaburribrand.com/wp-content/uploads/2024/04/Ciaburri-Brand-lg-W.png",
                   bodyParts: ["Chest", "Triceps", "Shoulders"],
                   description: "",
                   category: "Barbell")
    ]
}
