//
//  ContentView.swift
//  BetterRest
//
//  Created by Tibor Leupold on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUpTime = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("When you want to wake up?")
                    .font(.headline)
                DatePicker(
                    "",
                    selection: self.$wakeUpTime,
                    displayedComponents: .hourAndMinute
                )
                    .labelsHidden()
                
                Text("How much sleep do you like?")
                    .font(.headline)
                Stepper(
                    "\(self.sleepAmount.formatted()) hours",
                    value: self.$sleepAmount,
                    in: 4...12,
                    step: 0.25
                )
                
                Text("How much coffee do you drink?")
                    .font(.headline)
                Stepper(
                    self.coffeeAmount == 1 ? "1 cup" : "\(self.coffeeAmount) cups",
                    value: self.$coffeeAmount,
                    in: 1...20
                )
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Continue") {
                    self.next()
                }
            }
        }
    }
    
    func next() {
        print("Button pressed.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
