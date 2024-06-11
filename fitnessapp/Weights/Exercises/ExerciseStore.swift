////
////  ExerciseStore.swift
////  fitnessapp
////
////  Created by Gabriel Ciaburri on 6/7/24.
////
//
//import Foundation
//@MainActor
//@Observable
//class ExerciseStore {
//    var exercises: [Exercise] = []
//    
//    private static func fileURL() throws -> URL {
//        try FileManager.default.url(for: .documentDirectory,
//                                    in: .userDomainMask,
//                                    appropriateFor: nil,
//                                    create: false)
//        .appendingPathComponent("exercises.data")
//    }
//    
//    func load() async throws {
//        let task = Task<[Exercise], Error> {
//            let fileURL = try Self.fileURL()
//            guard let data = try? Data(contentsOf: fileURL) else {
//                return []
//            }
//            let exercises = try JSONDecoder().decode([Exercise].self, from: data)
//            return exercises
//        }
//        let exercises = try await task.value
//        self.exercises = exercises
//    }
//    
//    func save(exercises: [Exercise]) async throws {
//        let task = Task {
//            let data = try JSONEncoder().encode(exercises)
//            let outfile = try Self.fileURL()
//            try data.write(to: outfile)
//        }
//        _ = try await task.value
//    }
//}
