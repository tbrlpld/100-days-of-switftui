//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tibor Leupold on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var countries: [String]
    @State var correctCountry: Int
    
    @State var showResponse = false
    @State var message = "Answer"
    @State var messageButtonText = "Continue"
    
    @State var score = 0
    
    init() {
        self.countries = Self.getCountryArray()
        self.correctCountry = Self.getCorrectAnswer()
    }
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.3)
                .ignoresSafeArea()
           
            VStack {
                Spacer()
                VStack(spacing: 40) {
                    VStack {
                        Text("Select the flag of")
                            .font(.title2.weight(.semibold))
                        Text(self.countries[self.correctCountry])
                            .font(.largeTitle.weight(.bold))
                    }
                    
                    VStack(spacing: 30) {
                        ForEach(0..<3) { number in
                            Button {
                                self.checkAnwer(answer: number)
                            } label: {
                                Image(self.countries[number].lowercased())
                                    .clipShape(Rectangle()).cornerRadius(5)
                                    .shadow(
                                        color: Color.black.opacity(0.1),
                                        radius: 5,
                                        x: 3,
                                        y: 5
                                    )
                            }
                        }
                    }
                }
                Spacer()
                Text("\( self.score ) Points")
                    .font(.title2.weight(.semibold))
                Spacer()
            }
        }
        .foregroundColor(Color.primary)
        .alert(self.message, isPresented: self.$showResponse) {
            Button(self.messageButtonText) {
                self.askQuestion()
            }
        }
    }
    
    static func getCountryArray() -> [String] {
        return [
            "Estonia",
            "France",
            "Germany",
            "Italy",
            "Ireland",
            "Monaco",
            "Nigeria",
            "Russia",
            "Poland",
            "Spain",
            "UK",
            "US"
        ].shuffled()
    }
    
    static func getCorrectAnswer() -> Int {
         return Int.random(in: 0..<3)
    }
    
    func checkAnwer(answer: Int) {
        if answer == self.correctCountry {
            self.handleCorrectAnswer()
        } else {
            self.handleWrongAnswer()
        }
        self.showResponse = true
    }
    
    func askQuestion() {
        self.countries = Self.getCountryArray()
        self.correctCountry = Self.getCorrectAnswer()
    }
    
    func handleCorrectAnswer() {
        self.message = "Correct"
        self.messageButtonText = "Continue"
        self.score += 1
    }
    
    func handleWrongAnswer() {
        self.message = "Wrong"
        self.messageButtonText = "New round"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
