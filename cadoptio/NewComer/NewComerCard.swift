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
    @State private var pulseOrderText = false
    
    var cats: [PetModel]
    
    var navigation: CardHeaderNavigation = .navigationLink
    
    var body: some View {
        CardContainer(height: 150) {
            VStack(alignment: .leading) {
                CardNavigationHeader(panel: .newComer, navigation: navigation) {
                    Label("New Comer", systemImage: "cat")
                        .foregroundStyle(.orange)
                }.padding()
                if #available(iOS 18.0, *) {
                    ScrollView(.horizontal) {
                        HStack() {
                            ForEach(cats, id: \.id) { cat in
                                NewComerItemView(cat: cat)
                                    .id(cat.id)
                            }
                            .listStyle(.plain)
                        }
                    }
                    .scrollPosition($scrollPosition)
                    .onReceive(timer) {_ in
                        xPosition += 0.5
                        if xPosition >= NewComerItemView.width * CGFloat(cats.count) {
                            xPosition = 0
                        }
                        
                        scrollPosition.scrollTo(x: xPosition)
                    }
                } else {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(cats, id: \.id) { cat in
                                NewComerItemView(cat: cat)
                            }
                            .listStyle(.plain)
                            .safeAreaPadding(.horizontal)
                        }.padding(0)
                    }
                }
            }
        }
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

