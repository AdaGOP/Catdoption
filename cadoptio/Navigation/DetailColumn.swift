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
            CatCornerView()
        case .shelter:
            CatCornerView()
        case .testimoni:
            CatCornerView()
        }
    }
}

struct DetailColumn_Previews: PreviewProvider {
    struct Preview: View {
        
        @State private var selection: Panel? = .catCorner
        
        var body: some View {
            DetailColumn(selection: $selection)
        }
    }
    
    static var previews: some View {
        Preview()
    }

}
