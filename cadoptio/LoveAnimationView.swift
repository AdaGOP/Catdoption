//
//  LoveAnimationView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 25/04/24.
//

import SwiftUI

struct LoveAnimationView: View {
    @State var isFavorite: Bool = false
    
    var body: some View {
        Button(action: {
                isFavorite.toggle()
        }) {
            Image(systemName: "heart.fill")
               .resizable()
               .frame(width: 35, height: 34)
               .foregroundColor(.pink)
        }
//        .symbolEffect(.pulse, value: isFavorite)
        .symbolEffect(.pulse, options: .repeating, value: isFavorite)
    }
}

#Preview {
    LoveAnimationView()
}
