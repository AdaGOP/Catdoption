//
//  AddNewPetView.swift
//  cadoptio
//
//  Created by octavianus on 24/04/24.
//

import SwiftUI
// STEP 9: Import SwiftData library
/// Your code will be here


struct AddNewPetView: View{
    @Environment(\.dismiss) var dismiss
    
    // STEP 10: Provide SwiftData model context using @Environment
    /// Your code will be here
    
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
                // STEP 12: Call saveNewPet() function
                /// Your code will be here
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
    // STEP 11: Create a function saveNewPet() to save a new pet data from each field using the defined context above
    /// Your code will be here
   
}

#Preview {
    AddNewPetView()
}
