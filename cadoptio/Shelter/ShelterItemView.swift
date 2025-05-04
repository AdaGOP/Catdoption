//
//  ShelterItemView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/25.
//

import SwiftUI

struct ShelterItemView: View {
    
    var shelter: ShelterModel
    
    init(shelter: ShelterModel) {
        self.shelter = shelter
    }
    
    var body: some View {
        Image(shelter.image ?? "placeholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 70, height: 100)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

struct ShelterItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                ShelterItemView(shelter: .init(
                    image: "shelter-budi",
                    name: "Budi Cat Shelter",
                    address: "Jakarta Selatan",
                    distance: 50))
                ShelterItemView(shelter: .init(
                    image: "shelter-catrescue",
                    name: "Cat Rescue Shelter",
                    address: "Tangerang Selatan",
                    distance: 20))
                ShelterItemView(shelter: .init(
                    image: "shelter-halocat",
                    name: "Halo Cat Adoption Shelter",
                    address: "Bandung",
                    distance: 100))
                ShelterItemView(shelter: .init(
                    image: "shelter-popo",
                    name: "Popo Cat Shelter",
                    address: "Jakarta Timur",
                    distance: 300))
            }
            .frame(width: 120, height: 120)
            .border(.quaternary)
        }
        .padding()
    }
}
