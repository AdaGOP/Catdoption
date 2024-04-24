//
//  PetInfoView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 23/04/24.
//

import SwiftUI

struct PetInfoView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.orange)
            .opacity(0.2)
            .frame(width: 112, height: 50)
            .overlay(
                VStack{
                    Image(systemName: "person.fill")
                        .foregroundStyle(.orange)
                    Text("3.5 km")
                }
            )
    }
}

#Preview {
    PetInfoView()
}
