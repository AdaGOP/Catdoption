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
        "Transparent info", "Highly recommended", "Stressed-out", "Purrfect match", "Cuddly kittens", "Adopted from a shelter", "Adopted from a rescue group", "Sick kittens", "Happy kittens"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Adopter Testimonials", systemImage: "quote.bubble")
                .font(.headline)
            
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
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.adaptiveSystemBackground.opacity(0.95))
                .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
        )
        .padding(.horizontal)
    }
}

#Preview {
    TestimoniCardView()
}
