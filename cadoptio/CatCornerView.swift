//
//  CatCornerView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 28/04/25.
//

import SwiftUI

struct CatCornerView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Image("promo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .top)
                    .padding(.top, -160)
                NewComerCard(cats: PetData.generatePets())
                Divider()
                ShelterCard(cats: PetData.generatePets())
                Divider()
            }
            .navigationBarTitle("Cat Corner")
        }
       
       
    }
}

#Preview {
    CatCornerView()
}
