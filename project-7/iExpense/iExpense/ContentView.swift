//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.expenses.items, id: \.self.name) {
                    Text($0.name)
                }
                .onDelete(perform: self.removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add") {
                    let item = ExpenseItem(name: "Test", type: "test", amount: 5)
                    self.expenses.items.append(item)
                }
            }
        }
    }
    
    func removeItem (at offset: IndexSet) {
        self.expenses.items.remove(atOffsets: offset)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
