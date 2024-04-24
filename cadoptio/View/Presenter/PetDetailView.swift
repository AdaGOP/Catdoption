//
//  PetDetailView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 19/04/24.
//

import SwiftUI

struct PetDetailView: View {
    
    var pet: PetModel
    
    @State var isFavorite: Bool = false
    @State var loveIcon: String = "heart"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
           
            Image(pet.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .ignoresSafeArea()
            Text(pet.name)
                .padding([.leading, .top])
                .font(.largeTitle)
                .bold()
            Text("Persian cat - 3 years old")
                .foregroundStyle(.gray)
                .padding(.leading)
            
            HStack{
                PetInfoView()
                PetInfoView()
                PetInfoView()
            }
            .padding()
            
            PetOwnerView()
            
            Button {
                print("do something")
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.orange)
                    .frame(width: 358, height: 50)
                    .overlay( Text("Request to adopt")
                        .foregroundStyle(.white))
            }
            .padding()
            Spacer()
        }
        .toolbar {
            Button(action: {
                // STEP 2: Add animation here
                isFavorite.toggle()
                loveIcon = isFavorite ? "heart.fill" : "heart"
            }) {
                Image(systemName: loveIcon)
                    .resizable()
                    .frame(width: 35, height: 34)
                    .foregroundColor(.white)
                
            }
            // STEP 3: Add gesture and haptic feedback or animation here
            
        }
    }
        
}

#Preview {
    PetDetailView(pet: PetModel(name: "Butet", breed: "Domestic", distance: 1, weight: "3 kg", gender: "Female", imageName: "Butet"))
}
