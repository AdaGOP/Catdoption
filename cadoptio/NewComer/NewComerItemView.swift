//
//  NewComerItemView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/25.
//

import SwiftUI

struct NewComerItemView: View {
    static let itemSize = CGSize(width: 100, height:  130)
    var cat: PetModel
    
    public init(cat: PetModel) {
        self.cat = cat
    }
    
    var body: some View {
        VStack {
            Image(cat.image ?? "placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        }
        .padding(0)
        .frame(width: Self.itemSize.width,
               height: Self.itemSize.height)
        
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
            .frame(width: 120, height: 120)
            .border(.quaternary)
        }
        .padding()
    }
}
