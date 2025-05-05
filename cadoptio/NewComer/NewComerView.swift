//
//  NewComerView.swift
//  cadoptio
//
//  Created by Delvina J on 29/04/25.
//

import SwiftUI

struct NewComerView: View {
    private var cats: [PetModel] = PetData.generatePets()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 5) {
                    ForEach(cats, id: \.id) { cat in
                        NewComerItemView(cat: cat)
                            .padding(.bottom, 5)
                            .frame(width: geo.size.width * 0.965)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding([.leading, .trailing], geo.size.width * 0.015)
                }
            }
        }
    }
    
    
}

#Preview {
    NewComerView()
}
