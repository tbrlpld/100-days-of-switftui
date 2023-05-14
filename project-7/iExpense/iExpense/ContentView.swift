//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var activeNumber = 1
    
    var body: some View {
        VStack {
            List {
                ForEach(self.numbers, id: \.self) {
                    Text("Row \($0)")
                }
                .onDelete {indexSet in self.deleteNumber(at: indexSet) }
                
            }
            Button("Add number") { self.addNumber() }
        }
    }
    
    func addNumber() {
        self.numbers.append(self.activeNumber)
        self.activeNumber += 1
    }
    
    func deleteNumber(at indexSet: IndexSet) {
        self.numbers.remove(atOffsets: indexSet)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
