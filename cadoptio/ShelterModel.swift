//
//  ShelterModel.swift
//  cadoptio
//
//  Created by Delvina J on 30/04/25.
//

import Foundation

public struct ShelterModel {
    let id = UUID()
    let image: String?
    let name: String
    let address: String
    let distance: Double
    
    static var generateShelterData: [ShelterModel] = [
        .init(image: "shelter-budi",
              name: "Budi Cat Shelter",
              address: "Jakarta Selatan",
              distance: 50),
        .init(image: "shelter-catrescue",
              name: "Cat Rescue Shelter",
              address: "Tangerang Selatan",
              distance: 20),
        .init(image: "shelter-halocat",
              name: "Halo Cat Adoption Shelter",
              address: "Bandung",
              distance: 100),
        .init(image: "shelter-popo",
              name: "Popo Cat Shelter",
              address: "Jakarta Timur",
              distance: 300)
        
    ]
}
