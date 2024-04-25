//
//  PetDetailView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 19/04/24.
//

import SwiftUI
import SwiftData

struct PetDetailView: View {
    var pet: PetModel
    @State var showingSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Image(pet.imageName ?? "no image")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .ignoresSafeArea()
                .padding(.bottom)
            Text(pet.name ?? "no name")
                .padding(.leading)
                .font(.largeTitle)
                .bold()
            Text("Persian cat - 3 years old")
                .foregroundStyle(.gray)
                .padding(.leading)
            
            HStack{
                PetInfoItemView()
                PetInfoItemView()
                PetInfoItemView()
            }
            .padding()
            
            PetOwnerView()
                .padding()
            
            Button {
                showingSheet.toggle()
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.orange)
                    .frame(width: 358, height: 50)
                    .overlay( Text("Request to adopt")
                        .foregroundStyle(.white))
            }
            .sheet(isPresented: $showingSheet, content: {
                SpinnerView()
            })
            .padding()
            Spacer()
        }
    }
}

struct PetInfoItemView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.orange)
            .opacity(0.2)
            .frame(width: 112, height: 50)
            .overlay(
                VStack{
                    Image(systemName: "person.fill")
                        .foregroundStyle(.orange)
                    Text("3.5 km")
                }
            )
    }
}
struct PetOwnerView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 0){
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                VStack(alignment: .leading){
                    Text("Owned by")
                        .foregroundStyle(.gray)
                    Text("John Keating")
                }
            }
            Text("I've just been given the opportunity to study abroad next year, but unfortunately, I can't take her with me. I'm seeking good-hearted people who would be willing to be Butet's new parents.")
                .multilineTextAlignment(.leading)
                
        }
    }
}

#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: PetModel.self, configurations: config)
    
    return PetDetailView(pet: PetModel(
        name: "Butet",
        breed: "Domestic",
        weight: "3 kg",
        gender: "Female",
        imageName: "Butet")
    )
    
}


