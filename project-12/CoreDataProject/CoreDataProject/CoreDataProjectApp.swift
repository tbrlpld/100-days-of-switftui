//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Tibor Leupold on 6/7/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    // Attach the data store to the app object so it is available for the entire life cycle.
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Attach the managed object context to the content view.
                // This provides access to the actual data.
                .environment(\.managedObjectContext, self.dataController.container.viewContext)
        }
    }
}
