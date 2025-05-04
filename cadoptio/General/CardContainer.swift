//
//  CardContainer.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 05/05/25.
//

import SwiftUI

struct CardContainer<Content: View>: View {
    let content: Content
    var height: CGFloat?

    init(height: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.height = height
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(height: height) // Apply fixed height if needed
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.adaptiveSystemBackground.opacity(0.95))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}
