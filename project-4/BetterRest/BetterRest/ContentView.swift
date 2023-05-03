//
//  ContentView.swift
//  BetterRest
//
//  Created by Tibor Leupold on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUpTime = Date.now
    
    var body: some View {
        VStack(spacing: 20) {
            Stepper(
                "\(self.sleepAmount.formatted())",
                value: self.$sleepAmount,
                in: 4...12,
                step: 0.25
            )
            DatePicker(
                "Wake up time?",
                selection: self.$wakeUpTime,
                in: Date.now...
            )
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
