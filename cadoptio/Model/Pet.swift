//
//  PetModel.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import Foundation
// STEP 1: Import SwiftData library
/// Your code will be here

// STEP 2: Mark class below as SwiftData model
/// Your code will be here
class PetModel: Identifiable {
    var name: String? = ""
    var breed: String? = ""
    var weight: String? = ""
    var gender: String? = ""
    var imageName: String? = ""
    
    init(name: String, breed: String, weight: String, gender: String, imageName: String) {
        self.name = name
        self.breed = breed
        self.weight = weight
        self.gender = gender
        self.imageName = imageName
    }
}
