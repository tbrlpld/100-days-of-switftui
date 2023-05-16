//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/15/23.
//

import Foundation


struct ExpenseItem: Identifiable, Codable {
    // Using a variable here, so that it can be initialized when decoding an object.
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
