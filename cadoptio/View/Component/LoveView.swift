//
//  LoveView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 25/04/24.
//

import SwiftUI

struct LoveView: View {
    @Binding var isLoveAppear: Bool
    @State var isLoveAnimated: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            Button {
                isLoveAppear.toggle()
            } label: {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .foregroundStyle(.pink)
            }
            .symbolEffect(.pulse, options: .repeating, value: isLoveAnimated)
        }
        .onAppear(perform: {
            isLoveAnimated.toggle()
        })
    }
}

//#Preview {
//    LoveView()
//}
