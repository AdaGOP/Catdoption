//
//  PetModel.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import Foundation

struct PetModel: Hashable {
    var name: String
    var breed: String
    var distance: Double
    var weight: String
    var gender: String
    var imageName: String
    
    static func getPetData() -> [PetModel] {
        return [
            PetModel(name: "Leppy", breed: "Domestic", distance: 1, weight: "3 kg", gender: "Female", imageName: "Leppy"),
            PetModel(name: "Butet", breed: "Persian", distance: 3.5, weight: "4,8 kg", gender: "Female", imageName: "Butet"),
            PetModel(name: "Sky", breed: "Ragdoll", distance: 5, weight: "5 kg", gender: "Male", imageName: "Sky"),
            PetModel(name: "Kentang", breed: "Himalayan", distance: 9, weight: "2 kg", gender: "Male", imageName: "Kentang")
        ]
    }
}
