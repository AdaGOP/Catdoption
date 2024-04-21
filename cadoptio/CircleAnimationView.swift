//
//  CircleAnimationView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import SwiftUI

struct CircleAnimationView: View {
    @State var currentOpacity = 0.1
    
    var body: some View{
        Circle()
            .opacity(currentOpacity)
            .animation(
                .easeInOut(duration: 2.0),
                value: currentOpacity
            )
            .onTapGesture {
                currentOpacity = 1
            }
    }
}

#Preview {
    CircleAnimationView()
}
