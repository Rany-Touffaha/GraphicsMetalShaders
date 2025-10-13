//
//  GraphicsProgrammingMetalApp.swift
//  GraphicsProgrammingMetal
//
//  Created by Rany Touffaha on 29/09/2025.
//

import SwiftUI

@main
struct GraphicsProgrammingMetalApp: App {
    var body: some Scene {
        WindowGroup {
            Gray_Scale_View()
                .modelContainer(for:WeightsModel.self)
        }
    }
}
