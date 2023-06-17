//
//  UseCoreDataApp.swift
//  UseCoreData
//
//  Created by Tibor Leupold on 6/17/23.
//

import SwiftUI

@main
struct UseCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
