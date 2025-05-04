//
//  TestimoniCardView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 30/04/25.
//

import SwiftUI

struct TestimoniCardView: View {
    private let tags: [String] = [
        "Loved the staff", "Smooth process", "Would adopt again", "Healthy kittens",
        "Great communication",  "Clean shelter",
        "Easy paperwork", "Friendly volunteers", "Quick adoption",
        "Transparent info", "Highly recommended", "Stressed-out", "Purrfect match", "Cuddly kittens", "Adopted from a shelter"
    ]
    
    var navigation: CardHeaderNavigation = .navigationLink
    
    var body: some View {
        CardContainer(height: 420) {
            VStack(alignment: .leading, spacing: 12) {
                CardNavigationHeader(panel: .testimoni, navigation: navigation) {
                    Label("Adopter Testimonials", systemImage: "quote.bubble")
                        .foregroundStyle(.orange)
                }.padding(.bottom, 4)
                
                FlowLayout(alignment: .leading) {
                    ForEach(tags, id: \.self) { tag in
                        Text(tag)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.adaptiveSystemGray6)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

#Preview {
    TestimoniCardView()
}
