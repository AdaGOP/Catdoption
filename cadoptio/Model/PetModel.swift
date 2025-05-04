//
//  PetModel.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 05/05/25.
//

import Foundation

public struct PetModel {
    let id = UUID()
    let image: String?
    let name: String
    let type: String
    let distance: Double
    let weight: Double
    let gender: String
}

final class PetData {
    static func generatePets() -> [PetModel] {
        return [
            PetModel(image: "leppy", name: "Leppy", type: "Domestic", distance: 1.0, weight: 3.0, gender: "Male"),
            PetModel(image: "butet", name: "Butet", type: "Persian", distance: 3.5, weight: 5.0, gender: "Female"),
            PetModel(image: "sky", name: "Sky", type: "Domestic", distance: 8.5, weight: 4.9, gender: "Female"),
            PetModel(image: "kentang", name: "Kentang", type: "British Shorthair", distance: 8.5, weight: 4.2, gender: "Female"),
            PetModel(image: "leppy", name: "Leppy", type: "Domestic", distance: 1.0, weight: 3.0, gender: "Male"),
            PetModel(image: "butet", name: "Butet", type: "Persian", distance: 3.5, weight: 5.0, gender: "Female"),
            PetModel(image: "sky", name: "Sky", type: "Domestic", distance: 8.5, weight: 4.9, gender: "Female")
        ]
    }
    
    static func minWeight() -> Double {
        return generatePets().map { $0.weight }.min() ?? 0.0
    }
    
    static func maxWeight() -> Double {
        return generatePets().map { $0.weight }.max() ?? 0.0
    }
}
