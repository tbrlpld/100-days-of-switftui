//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/15/23.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    
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
                
                TextField("Amount", value: self.$amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add expense")
            .toolbar {
                Button("Save") {
                    print("Saving item")
                    let item = ExpenseItem(
                        name: self.name,
                        type: self.type,
                        amount: self.amount
                    )
                    self.expenses.items.append(item)
                    self.dismiss()
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
