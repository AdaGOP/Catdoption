//
//  NewComerItemView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/25.
//

import SwiftUI

struct NewComerItemView: View {
    static let width: CGFloat = 100
    var cat: PetModel
    
    public init(cat: PetModel) {
        self.cat = cat
    }
    
    var body: some View {
        VStack {
            Image(cat.image ?? "placeholder")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: Self.width, height: Self.width)
            Text(cat.name)
                .padding(.bottom, 10)
        }
        .padding(0)
        .frame(width: Self.width)
        
    }
}

struct NewComerItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                NewComerItemView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
                NewComerItemView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
                NewComerItemView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
            }
        }
        .padding()
    }
}
