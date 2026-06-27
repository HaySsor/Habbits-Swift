//
//  HabbitsApp.swift
//  Habbits
//
//  Created by Przemek Hussar on 11/06/2026.
//

import SwiftUI
import SwiftData

@main
struct HabbitsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Activity.self, Session.self])
    }
}
