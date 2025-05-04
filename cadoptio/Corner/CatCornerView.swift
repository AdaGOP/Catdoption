//
//  CatCornerView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 28/04/25.
//

import SwiftUI

struct CatCornerView: View {
    
    var body: some View {
        WidthThresholdReader(widthThreshold: 520) { proxy in
            ScrollView(.vertical) {
                Image("promo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .top)
                    .padding(.top, -160)
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    if proxy.isCompact {
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
#if os(iOS)
            .navigationBarTitle("Cat Corner")
#endif
        }
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
