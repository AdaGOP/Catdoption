//
//  DetailColumn.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/25.
//

import SwiftUI

struct DetailColumn: View {
    
    @Binding var selection: Panel?
    
    var body: some View {
        switch selection ?? .catCorner {
        case .catCorner:
            CatCornerView()
        case .newComer:
            NewComerView()
        case .shelter:
            ShelterView()
        case .testimoni:
            TestimoniView()
        }
    }
}

struct DetailColumn_Previews: PreviewProvider {
    struct Preview: View {
        
        @State private var selection: Panel? = .shelter
        
        var body: some View {
            DetailColumn(selection: $selection)
        }
    }
    
    static var previews: some View {
        Preview()
    }

}
