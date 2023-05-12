//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Tibor Leupold on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    static var maxNumberRange = 2..<13
    @State private var maxMultiplicationNumber = 2
    
    static var possibleNumberOfRounds = [5, 10, 20]
    @State private var maxNumberOfRounds = Self.possibleNumberOfRounds[0]
    
    var body: some View {
        Form {
            Section {
                Stepper("Max num: \(self.maxMultiplicationNumber)", value: self.$maxMultiplicationNumber)
                Picker("Number of rounds", selection: self.$maxNumberOfRounds) {
                    ForEach(Self.possibleNumberOfRounds, id: \.self) {
                        Text("\($0) rounds")
                    }
                }
            }
            
            Button("Ask") {
                self.askQuestion()
            }
        }
        .onAppear {
            self.askQuestion()
        }
    }
    
    func askQuestion() {
        print("Asking")
        print(self.getRandomNumber())
    }
    
    func getRandomNumber() -> Int {
        let range = self.getSelectedRange()
        let numbers = Array(range)
        return numbers.randomElement() ?? 2
    }
    
    func getSelectedRange() -> Range<Int> {
        return Range(uncheckedBounds: (lower: 2, upper: 5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
