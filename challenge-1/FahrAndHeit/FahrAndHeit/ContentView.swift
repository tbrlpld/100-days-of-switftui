//
//  ContentView.swift
//  FahrAndHeit
//
//  Created by Tibor Leupold on 4/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var fromAmount: Double = 0
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
