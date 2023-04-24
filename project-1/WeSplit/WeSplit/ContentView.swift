//
//  ContentView.swift
//  WeSplit
//
//  Created by Tibor Leupold on 4/23/23.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: self.$checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    ).keyboardType(.decimalPad)
                    
                    Picker(
                        "Number of people",
                        selection: self.$numberOfPeople
                    ){
                        ForEach(2..<100){ Text("\($0) people") }
                    }
                }
                
                Section {
                    Text(
                        self.checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                }
            }.navigationTitle("WeSplit")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
