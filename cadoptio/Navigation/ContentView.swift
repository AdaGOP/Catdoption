//
//  ContentView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Panel? = .catCorner
    
    var body: some View {
        NavigationSplitView {
            Sidebar(selection: $selection)
        } detail: {
            NavigationStack(){
                DetailColumn(selection: $selection)
            }
        }
    }
}

#Preview {
    ContentView()
}
