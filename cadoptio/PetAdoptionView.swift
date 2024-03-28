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
                
                // PET 2
                HStack() {
                    Image("Butet")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Butet")
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
                        Text("Persian")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        HStack {
                            HStack {
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .foregroundColor(.orange)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 14, height: 14)
                                Text("3,5 km")
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
                                Text("5 kg")
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
                                Text("Female")
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
                
                // PET 3
                HStack() {
                    Image("Sky")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Sky")
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
                                Text("8,5 km")
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
                                Text("4,9 kg")
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
                                Text("Female")
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
                
                // PET 4
                HStack() {
                    Image("Kentang")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Kentang")
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
                        Text("British Shorthair")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        HStack {
                            HStack {
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .foregroundColor(.orange)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 14, height: 14)
                                Text("8,5 km")
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
                                Text("4,9 kg")
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
                                Text("Female")
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
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptionView()
    }
}
