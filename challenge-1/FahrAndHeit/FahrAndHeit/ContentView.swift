//
//  ContentView.swift
//  FahrAndHeit
//
//  Created by Tibor Leupold on 4/26/23.
//

import SwiftUI


struct ContentView: View {
    @State private var fromAmount: Double = 0
    @FocusState private var fromAmountFocused: Bool
    
    let celsius = "℃"
    let fahrenheit = "℉"
    var availableUnits: [String] {
        [self.celsius, self.fahrenheit]
    }
    
    @State private var pickedUnit: String = ""
    
    var toUnit: String {
        switch self.pickedUnit {
            case self.celsius:
                return self.fahrenheit
            case self.fahrenheit:
                return self.celsius
            default:
                return ""
        }
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
                    
                    Picker("Unit", selection: self.$pickedUnit) {
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
