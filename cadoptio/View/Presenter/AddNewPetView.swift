//
//  AddNewPetView.swift
//  cadoptio
//
//  Created by octavianus on 24/04/24.
//

import Foundation
import SwiftUI
import SwiftData


struct AddNewPetView: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State var petName: String = ""
    @State var petGender: String = ""
    @State var petBreed: String = ""
    @State var petWeight: String = ""
    
    var body: some View{
        Form{
            Section{
                TextField("Pet Name", text: $petName)
                
                TextField("Breed", text: $petBreed)
                
                TextField("Weight", text: $petWeight)
                    .keyboardType(.numberPad)
                
                Picker(selection: $petGender) {
                    Text("Male")
                    Text("Female")
                } label: {
                    Text("Pet Gender")
                }
                .pickerStyle(.navigationLink)
            }
            Button(action: {
               saveNewPet()
                dismiss()
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
           
        }
    }
    
    func saveNewPet(){
        let newPet = PetModel(name: petName, breed: petBreed, weight: petWeight, gender: petGender, imageName: "")
        context.insert(newPet)
        dismiss()
    }
}

#Preview {
    AddNewPetView()
}
