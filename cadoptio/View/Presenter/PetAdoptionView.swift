//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI

struct PetAdoptionView: View {
    
    @State private var isFilterViewPresented = false
    let petData = PetModel.getPetData()
    
    var body: some View {
        NavigationStack {
            List(petData, id: \.self) { pet in
                // STEP 1: Add navigationLink to the code below
                PetCardView(pet: pet, onHeartTap: {})
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Discover")
            .toolbar {
                Button(action: {
                    isFilterViewPresented = true
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .foregroundColor(.orange)
                }
            }
            .sheet(isPresented: $isFilterViewPresented) {
                FilterView()
            }
        }
    }
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptionView()
    }
}
