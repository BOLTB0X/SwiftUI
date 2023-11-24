//
//  UIViewDemoApp.swift
//  UIViewDemo
//
//  Created by lkh on 11/24/23.
//

import SwiftUI

@main
struct UIViewDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
