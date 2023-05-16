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
                ForEach(self.expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.subheadline)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: self.removeItem)
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
        self.expenses.items.remove(atOffsets: offset)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
