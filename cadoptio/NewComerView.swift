//
//  NewComerView.swift
//  cadoptio
//
//  Created by Delvina J on 29/04/25.
//

import SwiftUI

public struct NewComerView: View {
    static let itemSize = CGSize(width: 100, height:  130)
    var cat: PetModel
    
    public init(cat: PetModel) {
        self.cat = cat
    }

    public var body: some View {
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

struct NewComerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                NewComerView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
                NewComerView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
                NewComerView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
            }
            .frame(width: 120, height: 120)
            .border(.quaternary)
        }
        .padding()
    }
}
