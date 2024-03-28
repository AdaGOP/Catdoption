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
                HStack() {
                    Image("Leppy")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Leppy")
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
                        Text("Domestic")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        HStack {
                            HStack {
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .foregroundColor(.orange)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 14, height: 14)
                                    .opacity(calculateDistanceOpacity(distance: 1.0))
                                Text("1 km")
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
                                    .opacity(calculateWeightOpacity(weight: 3.0))
                                Text("3 kg")
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
                                Text("Male")
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

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptionView()
    }
}
