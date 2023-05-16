//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/15/23.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: self.$name)
                
                Picker("Type", selection: self.$type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.navigationLink)
                
                TextField("Amount", value: self.$amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(
                        name: self.name,
                        type: self.type,
                        amount: self.amount
                    )
                    self.expenses.items.append(item)
                }
            }
        }
        
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
