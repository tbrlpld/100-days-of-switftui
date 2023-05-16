//
//  Expenses.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/15/23.
//

import Foundation


class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            guard let encodedData = try? encoder.encode(items) else {
                print("Could not encode data")
                return
            }
            UserDefaults.standard.set(encodedData, forKey: "items")
        }
    }
    
    init() {
        // Set default value
        self.items = []
        
        let decoder = JSONDecoder()
        guard let encodedData = UserDefaults.standard.data(forKey: "items") else {
            print("No data found in user defaults.")
            return
            
        }
        guard let items = try? decoder.decode([ExpenseItem].self, from: encodedData) else {
            print("Could not decode expenses from user defaults")
            return
        }
        
        self.items = items
    }
}
