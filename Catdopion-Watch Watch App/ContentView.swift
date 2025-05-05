//
//  ContentView.swift
//  Catdopion-Watch Watch App
//
//  Created by khoirunnisa' rizky noor fatimah on 05/05/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            NewComerView()
                .navigationTitle("New Comer")
        }
        
    }
    
}

#Preview {
    ContentView()
}
