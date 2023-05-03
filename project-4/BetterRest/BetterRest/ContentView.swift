//
//  ContentView.swift
//  BetterRest
//
//  Created by Tibor Leupold on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var sleepAmount = 8.0
    var body: some View {
        Stepper(
            "\(self.sleepAmount.formatted())",
            value: self.$sleepAmount,
            in: 4...12,
            step: 0.25
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
