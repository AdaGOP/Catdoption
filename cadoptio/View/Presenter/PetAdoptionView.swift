//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI
// STEP 6: Import SwiftData library
/// Your code will be here

struct PetAdoptionView: View {
    
    // STEP 7: Provide SwiftData model context using @Environment
    /// Your code will be here
    @State private var isFilterViewPresented = false
    @State private var isAddNewPetViewPresented = false
    
    // STEP 8: Prepare SwiftData model to be accessed using @Query
    /// Your code will be here
    var pets: [PetModel] = [
        PetModel(name: "Leppy", breed: "Domestic", weight: "3 kg", gender: "Female", imageName: "Leppy"),
        PetModel(name: "Butet", breed: "Persian", weight: "4,8 kg", gender: "Female", imageName: "Butet"),
        PetModel(name: "Sky", breed: "Ragdoll", weight: "5 kg", gender: "Male", imageName: "Sky"),
        PetModel(name: "Kentang", breed: "Himalayan", weight: "2 kg", gender: "Male", imageName: "Kentang")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pets){pet in
                    PetCardView(pet: pet)
                }
                // STEP 14: Add modifier to perform delete function
                /// Your code will be here
        
            }
            .listStyle(.plain)
            .navigationTitle("My Pet")
            .toolbar {
                Button(action: {
                    isAddNewPetViewPresented = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                }
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
            .sheet(isPresented: $isAddNewPetViewPresented) {
                AddNewPetView()
            }
        }
    }
    
    // STEP 13: Create a function deletePet() to delete a pet data using the defined context above
    /// Your code will be here
    
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        
        // STEP 14: Configure the preview with the provided SwiftData model
        /// Your code will be here
        PetAdoptionView()
    }
}
