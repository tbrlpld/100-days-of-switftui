//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var expenses = Expenses()
    
    @State private var isShowingAddExpenseView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.expenses.items) {
                    Text($0.name)
                }
                .onDelete(perform: self.removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    self.isShowingAddExpenseView = true
                } label: {
                    Text("Add")
                }
            }
            .sheet(isPresented: self.$isShowingAddExpenseView) {
                AddExpenseView(expenses: self.expenses)
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
