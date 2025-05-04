//
//  ShelterAdoption.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 30/04/25.
//

import Foundation

struct ShelterAdoption: Identifiable {
    let id = UUID()
    let year: String
    let breed: String
    let adoptionRate: Double
    
    static func getSampleData() -> [ShelterAdoption] {
        return [
            // Siamese
            ShelterAdoption(year: "2021", breed: "Siamese", adoptionRate: 51.4),
            ShelterAdoption(year: "2022", breed: "Siamese", adoptionRate: 79.1),
            ShelterAdoption(year: "2023", breed: "Siamese", adoptionRate: 80.5),
            ShelterAdoption(year: "2024", breed: "Siamese", adoptionRate: 92.0),
            ShelterAdoption(year: "2025", breed: "Siamese", adoptionRate: 63.2),
            
            // Maine Coon
            ShelterAdoption(year: "2021", breed: "Maine Coon", adoptionRate: 54.2),
            ShelterAdoption(year: "2022", breed: "Maine Coon", adoptionRate: 75.5),
            ShelterAdoption(year: "2023", breed: "Maine Coon", adoptionRate: 66.0),
            ShelterAdoption(year: "2024", breed: "Maine Coon", adoptionRate: 77.3),
            ShelterAdoption(year: "2025", breed: "Maine Coon", adoptionRate: 88.9),
            
            // Bengal
            ShelterAdoption(year: "2021", breed: "Bengal", adoptionRate: 69.8),
            ShelterAdoption(year: "2022", breed: "Bengal", adoptionRate: 70.6),
            ShelterAdoption(year: "2023", breed: "Bengal", adoptionRate: 81.1),
            ShelterAdoption(year: "2024", breed: "Bengal", adoptionRate: 72.0),
            ShelterAdoption(year: "2025", breed: "Bengal", adoptionRate: 83.4)
        ]
    }
}
