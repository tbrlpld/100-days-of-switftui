//
//  ContentView.swift
//  FahrAndHeit
//
//  Created by Tibor Leupold on 4/26/23.
//

import SwiftUI


let celsius = "℃"
let fahrenheit = "℉"

struct ContentView: View {
    @State private var fromAmount: Double = 0
    @FocusState private var fromAmountFocused: Bool
    
    let availableUnits = [celsius, fahrenheit]
    
    @State private var pickedFromUnit: String = celsius
    
    var toUnit: String {
        self.pickedFromUnit == celsius ? fahrenheit : celsius
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: self.$fromAmount,
                        format: .number
                    )
                        .keyboardType(.numberPad)
                        .focused(self.$fromAmountFocused)
                    
                    Picker("Unit", selection: self.$pickedFromUnit) {
                        ForEach(self.availableUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical, 10)
                    
                } header: {
                    Text("From")
                }
                
                
                Section {
                    Text("\(self.fromAmount.formatted())\(self.toUnit)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                } header: {
                    Text("To")
                }
            }
            
            .navigationTitle("Fahr & Heit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { self.fromAmountFocused = false }
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
