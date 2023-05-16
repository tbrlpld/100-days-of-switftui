//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI


struct ExpenseListView: View {
    var items: [ExpenseItem]
    var deleteMethod: (IndexSet) -> Void
    
    var body: some View {
        ForEach(self.items) { item in
            HStack {
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                        .font(.subheadline)
                }
                Spacer()
                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .foregroundColor(self.amountColor(amount: item.amount))
            }
        }
        .onDelete(perform: self.deleteMethod)
    }
    
    func amountColor(amount: Double) -> Color {
        if amount < 10 {
            return .gray
        } else if amount < 100 {
            return .black
        } else {
            return .red
        }
    }
}


struct ContentView: View {
    @StateObject private var expenses = Expenses()
    
    @State private var isShowingAddExpenseView = false
    
    var body: some View {
        NavigationView {
            List {
                Section ("Personal") {
                    ExpenseListView(items: self.expenses.items, deleteMethod: self.removeItem)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    print("Showing add view")
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
        print("Deleting item")
        // Get index
        guard let index = offset.first else { return }
        // Get item at index
        let item = self.expenses.items[index]
        // Delete the list item that matches the selected item.
        // Currently this makes no sense because the array from which we retrieve the reference
        // is the same as the one we are manupilating.
        // But, this unlocks using different lists.
        // E.g. the item may be selected on a sublist, which will have different indecies than the list we delete from.
        self.expenses.items.removeAll { expenseItem in
            expenseItem.id == item.id
        }
      }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
