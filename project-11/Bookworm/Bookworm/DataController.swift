//
//  DataController.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/2/23.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init () {
        // Load connection to the data store
        self.container.loadPersistentStores { description, error in
            if let error = error {
                print("Error when accessing data store \(error.localizedDescription)")
            }
        }
    }
}
