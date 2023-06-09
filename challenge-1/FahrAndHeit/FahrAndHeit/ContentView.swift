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
    @State private var fromAmount: Double = 23
    @FocusState private var fromAmountFocused: Bool
    
    let availableUnits = [celsius, fahrenheit]
    
    @State private var pickedFromUnit: String = celsius
    
    var toUnit: String {
        self.pickedFromUnit == celsius ? fahrenheit : celsius
    }
    
    var toAmount: Double {
        if self.pickedFromUnit == celsius {
            return self.fromCelsiusToFahrenheit(self.fromAmount)
        }
        return self.fromFahrenheitToCelsius(self.fromAmount)
    }
    
    func fromCelsiusToFahrenheit(_ number: Double) -> Double {
        let celsius = Measurement(value: number, unit: UnitTemperature.celsius)
        return celsius.converted(to: .fahrenheit).value
    }
    
    func fromFahrenheitToCelsius(_ number: Double) -> Double {
        let fahrenheit = Measurement(value: number, unit: UnitTemperature.fahrenheit)
        return fahrenheit.converted(to: .celsius).value
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
                        .keyboardType(.decimalPad)
                        .focused(self.$fromAmountFocused)
                        .font(.title)
                        .padding(.vertical, 10)
                    
                    Picker("Unit", selection: self.$pickedFromUnit) {
                        ForEach(self.availableUnits, id: \.self) {
                            Text($0)
                                .fontWeight(.black)
                        }
                    }
                        .pickerStyle(.segmented)
                        .padding(.vertical, 10)
                    
                } header: {
                    Text("From")
                }
                
                Section {
                    Text("\(self.toAmount.formatted())\(self.toUnit)")
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
