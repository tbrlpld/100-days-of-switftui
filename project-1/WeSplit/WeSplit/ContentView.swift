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
    
    let tipPercentages = [0, 10, 15, 20, 25, 30]
    @State private var tipPercentage = 20
    
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
                    }.pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip amount", selection: self.$tipPercentage) {
                        ForEach(self.tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                        .pickerStyle(.segmented)
                        .padding(0.0)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                .padding(0.0)
                
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
