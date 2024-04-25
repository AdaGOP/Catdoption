//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI
import SwiftData

struct PetAdoptionView: View {
    
    @Environment(\.modelContext) var context
    @State private var isFilterViewPresented = false
    @State private var isAddNewPetViewPresented = false
    
    
    @Query var pets: [PetModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pets){pet in
                    PetCardView(pet: pet)
                }
                .onDelete(perform: delete)
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
    
    func delete(at offsets: IndexSet){
        for offset in offsets{
            let pet = pets[offset]
            context.delete(pet)
        }
    }
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: PetModel.self, configurations: config)
        
        PetAdoptionView()
    }
}
