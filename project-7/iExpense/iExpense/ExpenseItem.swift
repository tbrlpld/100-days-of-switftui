//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/15/23.
//

import Foundation


struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
