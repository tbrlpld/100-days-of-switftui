//
//  Expenses.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/15/23.
//

import Foundation


class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
