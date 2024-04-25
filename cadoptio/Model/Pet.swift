//
//  PetModel.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import Foundation
import SwiftData

@Model
class Pet: Identifiable, Hashable {
    var name: String?
    var breed: String?
    var weight: String?
    var gender: String?
    var imageName: String?
    
    init(name: String? = nil, breed: String? = nil, weight: String? = nil, gender: String? = nil, imageName: String? = nil) {
        self.name = name
        self.breed = breed
        self.weight = weight
        self.gender = gender
        self.imageName = imageName
    }
}

@Model
class Pet: Identifiable, Hashable{
    var id = UUID()
    var name: String?
    var breed: String?
    var weight: String?
    var gender: String?
    var imageName: String?
    
    init(id: UUID = UUID(), name: String? = nil, breed: String? = nil, weight: String? = nil, gender: String? = nil, imageName: String? = nil) {
        self.id = id
        self.name = name
        self.breed = breed
        self.weight = weight
        self.gender = gender
        self.imageName = imageName
    }
}
