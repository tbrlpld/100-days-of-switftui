//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI


struct ExpenseListView: View {
    var items: [ExpenseItem]
    var deleteMethod: (ExpenseItem) -> Void
    
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
        .onDelete(perform: self.removeItem)
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
    
    func removeItem (at offset: IndexSet) {
        print("Determining item to remove.")
        // Get index
        guard let index = offset.first else { return }
        // Get item at index
        let item = self.items[index]
        self.deleteMethod(item)
    }
}


struct ContentView: View {
    @StateObject private var expenses = Expenses()
    
    var personalExpenseItems: [ExpenseItem] {
        self.expenses.items.filter { $0.type == "Personal" }
    }
    var businessExpenseItems: [ExpenseItem] {
        self.expenses.items.filter { $0.type == "Business" }
    }
    
    @State private var isShowingAddExpenseView = false
    
    var body: some View {
        NavigationView {
            List {
                Section ("Personal") {
                    ExpenseListView(items: self.personalExpenseItems, deleteMethod: self.removeItem)
                }
                Section ("Business") {
                    ExpenseListView(items: self.businessExpenseItems, deleteMethod: self.removeItem)
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
    
    func removeItem (_ item: ExpenseItem) {
        print("Removing item: \(item.name)")
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
