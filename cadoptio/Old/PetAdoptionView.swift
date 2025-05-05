//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI

struct PetAdoptionView: View {
    
    // MARK: private properties
    private let allData: [PetModel] = PetData.generatePets()
    
    var body: some View {
        NavigationStack {
            List(allData, id: \.name) { model in
                NavigationLink(destination: DetailView()) {
                    PetCard(model: model)
                        .shadow(radius: 10)
                    #if os(iOS)
                        .listRowSeparator(Visibility.hidden)
                    #endif
                }
                
            }
#if os(iOS)
            .listStyle(.inset)
            .navigationTitle("Discover")
#endif
        }
    }
}

struct PetCard: View {
    let model: PetModel
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                PetInfo(type: model.type, name: model.name, distance: model.distance, weight: model.weight, gender: model.gender)
                    .padding(.horizontal, 10.0)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color(.white))
            .cornerRadius(8)
        }
    }
}

struct PetInfo: View {
    let type: String
    let name: String
    let distance: Double
    let weight: Double
    let gender: String
    
    var body: some View {
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
            }.padding(.trailing, 16)
            Text(type)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
            Spacer()
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
        }.padding(.vertical, 16.0)
    }
}

struct ImageView: View {
    let imageName: String
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .overlay(
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
    }
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptionView()
    }
}
