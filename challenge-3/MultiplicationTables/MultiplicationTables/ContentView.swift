//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Tibor Leupold on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    static var maxNumberRange = 2...12
    @State private var maxMultiplicationNumber = 2
    
    @State private var firstFactor = 1
    @State private var secondFactor = 1
    
    static var possibleNumberOfRounds = [5, 10, 20]
    @State private var maxNumberOfRounds = Self.possibleNumberOfRounds[0]
    
    var body: some View {
        Form {
            Section {
                Stepper(
                    "Include numbers up to \(self.maxMultiplicationNumber)",
                    value: self.$maxMultiplicationNumber,
                    in: Self.maxNumberRange
                )
                Picker("Number of rounds", selection: self.$maxNumberOfRounds) {
                    ForEach(Self.possibleNumberOfRounds, id: \.self) {
                        Text("\($0) rounds")
                    }
                }
            }
            
            Section {
                Text("What is \(self.firstFactor) x \(self.secondFactor)?")
                    .font(.title2)
                    .bold()
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
        self.firstFactor = self.getRandomNumber()
        self.secondFactor = self.getRandomNumber()
        print("\(self.firstFactor) x \(self.secondFactor)")
    }
    
    func getRandomNumber() -> Int {
        let range = self.getSelectedRange()
        let numbers = Array(range)
        return numbers.randomElement() ?? 2
    }
    
    func getSelectedRange() -> Range<Int> {
        return Range(uncheckedBounds: (lower: 1, upper: self.maxMultiplicationNumber + 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
