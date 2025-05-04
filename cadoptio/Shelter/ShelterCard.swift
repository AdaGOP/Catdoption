//
//  ShelterCard.swift
//  cadoptio
//
//  Created by Delvina J on 30/04/25.
//

import SwiftUI

struct ShelterCard: View {
    var shelters: [ShelterModel]
    var navigation: CardHeaderNavigation = .navigationLink
    
    @State private var pulseOrderText = false
    
    var body: some View {
        CardContainer(height: 150) {
            VStack(alignment: .leading) {
                VStack {
                    CardNavigationHeader(panel: .shelter, navigation: navigation) {
                        Label("Adoption Near You", systemImage: "house.circle")
                            .foregroundStyle(.orange)
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(shelters, id: \.name) { shelter in
                                ShelterItemView(shelter: shelter)
                                    .id(shelter.id)
                            }
                            .listStyle(.plain)
                            .safeAreaPadding(.horizontal)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}


struct ShelterCard_Previews: PreviewProvider {
    struct Preview: View {
        var body: some View {
            ShelterCard(shelters: ShelterModel.generateShelterData)
        }
    }
    
    static var previews: some View {
        NavigationStack {
            Preview()
        }
    }
}
