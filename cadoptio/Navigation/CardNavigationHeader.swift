//
//  CardNavigationHeader.swift
//  cadoptio
//
//  Created by Delvina J on 29/04/25.
//

import SwiftUI

struct CardNavigationHeader<Label: View>: View {
    var panel: Panel
    var navigation: CardHeaderNavigation
    @ViewBuilder var label: Label
    
    var body: some View {
        HStack {
            switch navigation {
            case .navigationLink:
                NavigationLink(value: panel) {
                    label
                }
            case .selection(let selection):
                Button {
                    selection.wrappedValue = panel
                } label: {
                    label
                }
            }
            
            Spacer()
        }
        .buttonStyle(.borderless)
        .labelStyle(.titleAndIcon)
    }
}

struct CardNavigationHeader_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CardNavigationHeader(panel: .newComer, navigation: .navigationLink) {
                Label("New Comer", systemImage: "cat")
            }
            .padding()
        }
    }
}
