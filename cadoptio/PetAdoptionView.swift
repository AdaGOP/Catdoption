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
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                
                // PET 1
                PetCard(name: "Leppy", breed: "Domestic", distance: "1 km", weight: "3 kg", gender: "Female", imageName: "Leppy", onHeartTap: {})
                // PET 2
                PetCard(name: "Butet", breed: "Persian", distance: "3,5 km", weight: "4,8 kg", gender: "Female", imageName: "Sky", onHeartTap: {})
                // PET 3
                PetCard(name: "Sky", breed: "Ragdoll", distance: "5 km", weight: "5 kg", gender: "Male", imageName: "Sky", onHeartTap: {})
                // PET 4
                PetCard(name: "Kentang", breed: "Himalayan", distance: "9 km", weight: "2 kg", gender: "Male", imageName: "Kentang", onHeartTap: {})
                
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
    var name: String
    var breed: String
    var distance: String
    var weight: String
    var gender: String
    var imageName: String
    var onHeartTap: () -> Void

    var body: some View {
        HStack() {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(name)
                        .font(.headline)
                    Spacer()
                    Button(action: onHeartTap) {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(.pink)
                            .font(.title)
                    }
                }
                Text(breed)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    HStack {
                        Image(systemName: "location.fill")
                            .resizable()
                            .foregroundColor(.orange)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                        Text(distance)
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
                        Text(weight)
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
        .shadow(color: .black.opacity(0.2), radius: 4)
    }
}


struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptionView()
    }
}
