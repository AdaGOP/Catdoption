//
//  ShelterView.swift
//  cadoptio
//
//  Created by Delvina J on 30/04/25.
//

import SwiftUI

public struct ShelterView: View {
    var cat: PetModel
    
    public init(cat: PetModel) {
        self.cat = cat
    }

    public var body: some View {
        Image(cat.image ?? "placeholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 70, height: 100)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
           
    }
}

struct ShelterView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                ShelterView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
                ShelterView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
                ShelterView(cat: .init(image: "butet", name: "abs", type: "asd", distance: 10, weight: 10, gender: "F"))
            }
            .frame(width: 120, height: 120)
            .border(.quaternary)
        }
        .padding()
    }
}
