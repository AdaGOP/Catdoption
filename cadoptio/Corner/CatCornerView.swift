//
//  CatCornerView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 28/04/25.
//

import SwiftUI

struct CatCornerView: View {
    
    @Environment(\.dynamicTypeSize) private var dynamicType
    
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var sizeClass
#endif
    
    var body: some View {
        GeometryReader { geometry in
            let isCompact = computeIsCompact(width: geometry.size.width)
            
            ScrollView(.vertical) {
                Image("promo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .top)
                    .padding(.top, -160)
                
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    if isCompact {
                        newComer
                        nearShelter
                        adoptionChart
                        testimoni
                    } else {
                        GridRow {
                            newComer
                            nearShelter
                        }
                        GridRow {
                            adoptionChart
                            testimoni
                        }
                    }
                }
            }
            .frame(height: geometry.size.height)
        }
    }
    
    
    func computeIsCompact(width: Double) -> Bool {
        if dynamicType >= .xxLarge {
            return true
        }
#if os(iOS)
        if sizeClass == .compact {
            return true
        }
#endif
        return width < 400
    }
    
    // MARK: - Cards
    var newComer: some View {
        NewComerCard(cats: PetData.generatePets())
    }
    
    var nearShelter: some View {
        ShelterCard(shelters: ShelterModel.generateShelterData)
    }
    
    var adoptionChart: some View {
        ShelterChartView()
    }
    
    var testimoni: some View {
        TestimoniCardView()
    }
}


#Preview {
    CatCornerView()
}
