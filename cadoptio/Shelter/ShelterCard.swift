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
                .scrollClipDisabled()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.adaptiveSystemBackground.opacity(0.95))
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
            )
        }
        .padding(10)
        .clipShape(ContainerRelativeShape())
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
