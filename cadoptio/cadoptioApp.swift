//
//  cadoptioApp.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI
import SwiftData



@main
struct cadoptioApp: App {
    var body: some Scene {
        WindowGroup {
            PetAdoptionView()
        }
        .modelContainer(for: [
            PetModel.self
        ])
    }
}
