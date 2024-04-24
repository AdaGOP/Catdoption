//
//  PetOwnerView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 23/04/24.
//

import SwiftUI

struct PetOwnerView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 0){
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                VStack(alignment: .leading){
                    Text("Owned by")
                        .foregroundStyle(.gray)
                    Text("John Keating")
                }
            }
            Text("I've just been given the opportunity to study abroad next year, but unfortunately, I can't take her with me. I'm seeking good-hearted people who would be willing to be Butet's new parents.")
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing])
                
        }
    }
}

#Preview {
    PetOwnerView()
}
