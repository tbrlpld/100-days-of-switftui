//
//  ContentView.swift
//  WeSplit
//
//  Created by Tibor Leupold on 4/23/23.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = 0.0
    
    var body: some View {
        Form {
            Section {
                TextField(
                    "Amount",
                    value: self.$checkAmount,
                    format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                ).keyboardType(.decimalPad)
            }
            
            Section {
                Text(
                    self.checkAmount,
                    format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                )
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
