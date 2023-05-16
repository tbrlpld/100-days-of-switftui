//
//  Expenses.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/15/23.
//

import Foundation


class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            print("Items were updated, saving to user data.")
            let encoder = JSONEncoder()
            guard let encodedData = try? encoder.encode(self.items) else {
                print("Could not encode data")
                return
            }
            print(encodedData)
            UserDefaults.standard.set(encodedData, forKey: "items")
            print("Done storing data.")
        }
    }
    
    init() {
        print("Restoring expense items")
        
        let defaultItems = [ExpenseItem]()
        
        print("Pulling data from user defaults")
        let decoder = JSONDecoder()
        guard let encodedData = UserDefaults.standard.data(forKey: "items") else {
            print("No data found in user defaults.")
            self.items = defaultItems
            return
        }
        print(encodedData)
        
        print("Decoding data from user defaults")
        guard let decodedData = try? decoder.decode([ExpenseItem].self, from: encodedData) else {
            print("Could not decode expenses from user defaults")
            self.items = defaultItems
            return
        }
        print(decodedData)
        
        self.items = decodedData
    }
}
