//
//  ShelterCard.swift
//  cadoptio
//
//  Created by Delvina J on 30/04/25.
//

import SwiftUI

struct ShelterCard: View {
    var cats: [PetModel]
    var navigation: CardHeaderNavigation = .navigationLink
    
    @State private var pulseOrderText = false
    
    var body: some View {
        VStack(alignment: .leading) {
            CardNavigationHeader(panel: .newComer, navigation: navigation) {
                Label("Adoption Near You", systemImage: "house.circle")
                    .foregroundStyle(.orange)
            }
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(cats, id: \.name) { cat in
                        ShelterView(cat: cat)
                            .id(cat.id)
                    }
                    .listStyle(.plain)
                    .safeAreaPadding(.horizontal)
                }
            }
            .scrollClipDisabled()
            
        }
        .padding(10)
        .clipShape(ContainerRelativeShape())
    }
}


struct ShelterCard_Previews: PreviewProvider {
    struct Preview: View {
        var body: some View {
            ShelterCard(cats: PetData.generatePets())
        }
    }
    
    static var previews: some View {
        NavigationStack {
            Preview()
        }
    }
}
