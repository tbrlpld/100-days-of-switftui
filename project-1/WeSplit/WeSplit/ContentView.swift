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
    
    let tipPercentages = Array(0..<101)
    @State private var tipPercentage = 20
    
    var grandTotal: Double {
        let tipPercentage = Double(self.tipPercentage)
        let tipAmount = self.checkAmount / 100 * tipPercentage
        let grandTotal = self.checkAmount + tipAmount
        return grandTotal
    }
    
    var amountPerPerson: Double {
        let personCount = Double(self.numberOfPeople)
        let totalPerPerson = self.grandTotal / personCount
        return totalPerPerson
    }
    
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: self.$checkAmount,
                        format: self.currencyFormat
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
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(
                        self.grandTotal,
                        format: self.currencyFormat
                    )
                } header: {
                    Text("Total amount")
                }

                Section {
                    Text(
                        self.amountPerPerson,
                        format: self.currencyFormat
                    )
                } header: {
                    Text("Amount per person")
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
