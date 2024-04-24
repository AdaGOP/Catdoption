//
//  PetCardView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import SwiftUI

struct PetCardView: View {
    
    var pet: PetModel
    var onHeartTap: () -> Void

    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 4)
                .frame(maxHeight: 100)
            HStack {
                Image(pet.imageName)
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .scaledToFill()
                    .cornerRadius(8)
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(pet.name)
                            .font(.headline)
                            .foregroundStyle(.black)
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
                    Text(pet.breed)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack {
                        HStack {
                            Image(systemName: "location.fill")
                                .resizable()
                                .foregroundColor(.orange)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                                .opacity(calculateDistanceOpacity(distance: pet.distance ))
                            Text(" \(pet.distance , specifier: "%.1f") Km")
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
                            Text(pet.weight)
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
                            Text(pet.gender)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 10.0)
            }
        }
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
