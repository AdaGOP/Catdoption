//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI

struct PetAdoptionView: View {
    let categories = ["All", "Cat", "Dog", "Hamster", "Rabbit"]
    let pets = [
        ("Leppy", "Domestic", 1.0, 3.0, "Male"),
        ("Butet", "Persian", 3.5, 5.0, "Female"),
        ("Sky", "Domestic", 8.5, 4.9, "Female"),
        ("Kentang", "British Shorthair", 8.5, 4.9, "Female")
    ]
    
    @State private var isFilterViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                ScrollView {
                    ForEach(pets, id: \.0) { pet in
                        PetCard(name: pet.0, type: pet.1, distance: pet.2, weight: pet.3, gender: pet.4)
                            .padding(.vertical, 8)
                    }
                }
                .padding(16)
                .shadow(radius: 10)
                
            }
            .navigationBarTitle("Discover")
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

struct PetCard: View {
    let name: String
    let type: String
    let distance: Double
    let weight: Double
    let gender: String
    
    var body: some View {
        HStack() {
            Rectangle()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .overlay(
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                )
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(name)
                        .font(.headline)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(.pink)
                            .font(.title)
                    }
                }
                Text(type)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    HStack {
                        Image(systemName: "location.fill")
                            .resizable()
                            .foregroundColor(.orange)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                        Text("\(distance, specifier: "%.1f") km")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "scalemass.fill")
                            .resizable()
                            .foregroundColor(.orange)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                        Text("\(weight, specifier: "%.1f") kg")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .resizable()
                            .foregroundColor(.orange)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                        Text(gender)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 10.0)
        }
        .background(Color(.white))
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .cornerRadius(8)
    }
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptionView()
    }
}
