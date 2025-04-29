//
//  Panel.swift
//  cadoptio
//
//  Created by Delvina J on 29/04/25.
//

import SwiftUI

/// An enum that represents the person's selection in the app's sidebar.
///
/// The `Panel` enum encodes the views the person can select in the sidebar, and hence appear in the detail view.
enum Panel: Hashable {
    /// The value for the ``NewComerView``.
    case newComer
    /// The value for the ``AdoptionNearYouView``.
    case adoptionNearYou
    /// The value for the ``TestimoniView``.
    case testimoni
}

/// The navigation sidebar view.
///
/// The ``ContentView`` presents this view as the navigation sidebar view on macOS and iPadOS, and the root of the navigation stack on iOS.
/// The superview passes the person's selection in the ``Sidebar`` as the ``selection`` binding.
struct Sidebar: View {
    /// The person's selection in the sidebar.
    ///
    /// This value is a binding, and the superview must pass in its value.
    @Binding var selection: Panel?
    
    /// The view body.
    ///
    /// The `Sidebar` view presents a `List` view, with a `NavigationLink` for each possible selection.
    var body: some View {
        List(selection: $selection) {
            NavigationLink(value: Panel.newComer) {
                Label("New Comer", systemImage: "box.truck")
            }
            
            NavigationLink(value: Panel.adoptionNearYou) {
                Label("Adoption Near You", systemImage: "shippingbox")
            }
            
            NavigationLink(value: Panel.testimoni) {
                Label("Testimoni", systemImage: "text.bubble")
            }
        }
        .navigationTitle("Cat Corner")
        #if os(macOS)
        .navigationSplitViewColumnWidth(min: 200, ideal: 200)
        #endif
    }
}

struct Sidebar_Previews: PreviewProvider {
    struct Preview: View {
        @State private var selection: Panel? = Panel.newComer
        var body: some View {
            Sidebar(selection: $selection)
        }
    }
    
    static var previews: some View {
        NavigationSplitView {
            Preview()
        } detail: {
           Text("Detail!")
        }
    }
}
