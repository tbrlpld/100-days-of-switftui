//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Tibor Leupold on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    static var numberRange = 2..<13
    @State private var maxMultiplicationNumber = 2
    
    static var possibleNumberOfRounds = [5, 10, 20]
    @State private var maxNumberOfRounds = Self.possibleNumberOfRounds[0]
    
    var body: some View {
        Form {
            Stepper("Max num: \(self.maxMultiplicationNumber)", value: self.$maxMultiplicationNumber)
            Picker("Number of rounds", selection: self.$maxNumberOfRounds) {
                ForEach(Self.possibleNumberOfRounds, id: \.self) {
                    Text("\($0) rounds")
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
