//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI

struct PetAdoptionView: View {
    
    @State private var isFilterViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                PetCard(name: "Leppy", type: "Domestic", distance: 1.0, weight: 3.0, gender: "Male")
                    .shadow(radius: 10)
                PetCard(name: "Butet", type: "Persian", distance: 3.5, weight: 5.0, gender: "Female")
                    .shadow(radius: 10)
                PetCard(name: "Sky", type: "Domestic", distance: 8.5, weight: 4.9, gender: "Female")
                    .shadow(radius: 10)
                PetCard(name: "Kentang", type: "British Shorthair", distance: 8.5, weight: 4.2, gender: "Female")
                    .shadow(radius: 10)
                Spacer()
            }
            .padding(16)
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
