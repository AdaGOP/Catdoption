//
//  NewComerCard.swift
//  cadoptio
//
//  Created by Delvina J on 29/04/25.
//

import SwiftUI

struct NewComerCard: View {
    @State private var scrollPosition = ScrollPosition()
    @State private var timer = Timer
        .publish(every: 0.01, on: .main, in: .default)
        .autoconnect()
    
    @State private var xPosition: CGFloat = 0
    
    var cats: [PetModel]
    var navigation: CardHeaderNavigation = .navigationLink
    
    @State private var pulseOrderText = false
    
    var body: some View {
        VStack(alignment: .leading) {
            CardNavigationHeader(panel: .newComer, navigation: navigation) {
                Label("New Comer", systemImage: "cat")
                    .foregroundStyle(.orange)
            }.padding()
            if #available(iOS 18.0, *) {
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(cats, id: \.name) { cat in
                            NewComerItemView(cat: cat)
                                .id(cat.id)
                        }
                        .listStyle(.plain)
                        .safeAreaPadding(.horizontal)
                    }
                }
                .scrollClipDisabled()
                .scrollPosition($scrollPosition)
                .onReceive(timer) {_ in
                    if xPosition >= (NewComerItemView.itemSize.width) * CGFloat(cats.count) {
                        xPosition = 0
                    } else {
                        xPosition += 0.5
                    }
                }
                .onChange(of: xPosition) { 
                    scrollPosition.scrollTo(x: xPosition)
                }
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(cats, id: \.name) { cat in
                            NewComerItemView(cat: cat)
                        }
                        .listStyle(.plain)
                        .safeAreaPadding(.horizontal)
                    }.padding(0)
                }
                .scrollClipDisabled()
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.systemBackground).opacity(0.95))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .padding(10)
        .clipShape(ContainerRelativeShape())
    }
}


struct NewComerCard_Previews: PreviewProvider {
    struct Preview: View {
        var body: some View {
            NewComerCard(cats: PetData.generatePets())
        }
    }
    
    static var previews: some View {
        NavigationStack {
            Preview()
        }
    }
}

