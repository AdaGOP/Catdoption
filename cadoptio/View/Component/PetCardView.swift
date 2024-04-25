//
//  PetCardView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import SwiftUI

struct PetCardView: View {
    
    var pet: PetModel
    
    var onHeartTap: (() -> Void)?

    var body: some View {
        HStack() {
            Image(pet.imageName ?? "no image")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(pet.name ?? "no name")
                        .font(.headline)
                    Spacer()
                    if let onHeartTap{
                        Button(action: onHeartTap) {
                            Image(systemName: "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18, height: 18)
                                .foregroundColor(.pink)
                                .font(.title)
                        }
                    }
                    
                }
                Text(pet.breed ?? "no breed")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    HStack {
                        Image(systemName: "scalemass.fill")
                            .resizable()
                            .foregroundColor(.orange)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                        Text(pet.weight ?? "Nil")
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
                        Text(pet.gender ?? "Nil")
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
        .listRowSeparator(.hidden)
    }
    
    func calculateWeightOpacity(weight: Double) -> Double {
        if weight < 3.5 {
            return 1.0
        } else {
            return 0.5
        }
    }
    
    func calculateDistanceOpacity(distance: Double) -> Double {
        if distance < 5.0 {
            return 1.0
        } else {
            return 0.5
        }
    }
}

