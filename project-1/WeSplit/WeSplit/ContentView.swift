//
//  ContentView.swift
//  WeSplit
//
//  Created by Tibor Leupold on 4/23/23.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = 0.0
    @FocusState private var amountFieldFocused: Bool
    
    let numbersOfPeople = Array(2..<100)
    @State private var numberOfPeople = 2
    
    let tipPercentages = [0, 10, 15, 20, 25, 30]
    @State private var tipPercentage = 20
    
    var amountPerPerson: Double {
        let tipPercentage = Double(self.tipPercentage)
        let tipAmount = self.checkAmount / 100 * tipPercentage
        let grandTotal = self.checkAmount + tipAmount
        let personCount = Double(self.numberOfPeople)
        let totalPerPerson = grandTotal / personCount
        return totalPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: self.$checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                        .keyboardType(.decimalPad)
                        .focused(self.$amountFieldFocused)
                    
                    Picker("Number of people", selection: self.$numberOfPeople) {
                        ForEach(self.numbersOfPeople, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                        .pickerStyle(.navigationLink)
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
                        self.amountPerPerson,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                }
            }
                .navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") { self.amountFieldFocused = false }
                    }
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
