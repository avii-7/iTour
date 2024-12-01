//
//  iTourApp.swift
//  iTour
//
//  Created by Arun on 01/12/24.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
