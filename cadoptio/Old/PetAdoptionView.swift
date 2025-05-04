//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI

struct PetAdoptionView: View {
    
    @State private var isFilterViewPresented = false
    @State private var searchText: String = ""
    @State private var filterModel: FilterModel = FilterModel(maxWeightValue: PetData.maxWeight())
    @State private var showDetailPage: Bool = false
    
    var filteredData: [PetModel] {
        allData
            .filter { $0.weight <= filterModel.maxWeightValue }
            .filter { searchText.isEmpty || $0.name.contains(searchText) }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                if filteredData.isEmpty {
                    Text("No result found")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                else {
                    ForEach(filteredData, id: \.name) { model in
                        NavigationLink(destination: DetailView()) {
                            PetCard(model: model)
                                .shadow(radius: 10)
                                .onTapGesture {
                                    showDetailPage.toggle()
                                }
                                .sensoryFeedback(.success, trigger: showDetailPage)
                        }
                    }
                }
                Spacer()
            }
            .padding(16)
            #if os(iOS)
            .navigationBarTitle("Discover")
            .toolbar {
                Button(action: {
                    isFilterViewPresented = true
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .foregroundColor(.orange)
                }
            }
            #endif
            
            .sheet(isPresented: $isFilterViewPresented) {
                FilterView(minWeight: PetData.minWeight(),
                           maxWeight: PetData.maxWeight(),
                           filterModel: $filterModel)
            }
        }
        .searchable(text: $searchText)
    }
    
    // MARK: private properties
    private let allData: [PetModel] = PetData.generatePets()
}

struct PetCard: View {
    let model: PetModel
    
    var body: some View {
        HStack {
            ImageView(imageName: "placeholder")
                .background(Color(.white))
            PetInfo(type: model.type, name: model.name, distance: model.distance, weight: model.weight, gender: model.gender)
                .padding(.horizontal, 10.0)
        }
        .frame(height: 120)
        .background(Color(.white))
        .cornerRadius(8)
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
            .frame(width: 120, height: 120) // Set the frame here
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

public struct PetModel {
    let id = UUID()
    let image: String?
    let name: String
    let type: String
    let distance: Double
    let weight: Double
    let gender: String
}

final class PetData {
    static func generatePets() -> [PetModel] {
        return [PetModel(image: "leppy", name: "Leppy", type: "Domestic", distance: 1.0, weight: 3.0, gender: "Male"),
                PetModel(image: "butet", name: "Butet", type: "Persian", distance: 3.5, weight: 5.0, gender: "Female"),
                PetModel(image: "sky", name: "Sky", type: "Domestic", distance: 8.5, weight: 4.9, gender: "Female"),
                PetModel(image: "kentang", name: "Kentang", type: "British Shorthair", distance: 8.5, weight: 4.2, gender: "Female")]
    }
    
    static func minWeight() -> Double {
        return generatePets().map { $0.weight }.min() ?? 0.0
    }
    
    static func maxWeight() -> Double {
        return generatePets().map { $0.weight }.max() ?? 0.0
    }
}
