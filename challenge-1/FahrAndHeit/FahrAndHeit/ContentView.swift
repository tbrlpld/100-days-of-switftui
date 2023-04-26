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
                    Text("Unit")
                } header: {
                    Text("From")
                }
                
                Section {
                    Text("Unit")
                        
                } header: {
                    Text("To")
                }
                
                
                Section {
                    Text("\(self.fromAmount.formatted())")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                } header: {
                    Text("Result")
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
