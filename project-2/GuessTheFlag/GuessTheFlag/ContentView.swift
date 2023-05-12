//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tibor Leupold on 4/27/23.
//

import SwiftUI


struct Flag: View {
    var flagImageName: String
    
    init(_ flagImageName: String) {
        self.flagImageName = flagImageName
    }
    
    var body: some View {
        Image(self.flagImageName)
            .clipShape(Rectangle())
            .cornerRadius(5)
            .shadow(
                color: Color.black.opacity(0.1),
                radius: 5,
                x: 3,
                y: 5
            )
    }
}

struct ContentView: View {
    @State var countries: [String]
    @State var correctCountry: Int
    
    @State var showResponse = false
    @State var responseTitle = "Answer"
    @State var responseMessage = ""
    @State var responseButtonText = "Continue"
    
    @State var score = 0
    let maxRounds = 3
    @State var playedRounds = 0
    @State var showGameOver = false
    
    @State private var animationOpacity = [1.0, 1.0, 1.0]
    @State private var animationScale = [1.0, 1.0, 1.0]
    
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
                                self.handleAnswerSubmitted(answer: number)
                                self.animateFlagSelection(selectedFlag: number)
                            } label: {
                                Flag(self.countries[number].lowercased())
                                    .opacity(self.animationOpacity[number])
                                    .scaleEffect(self.animationScale[number])
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
        .alert(self.responseTitle, isPresented: self.$showResponse) {
            Button(self.responseButtonText) {
                self.handleResponseDismissed()
            }
        } message: {
            if self.responseMessage != "" {
                Text(self.responseMessage)
            }
        }
        .alert("Game over", isPresented: self.$showGameOver) {
            Button("Play again") {
                self.handleGameOverDismissed()
            }
        } message: {
            Text("You got \(self.score) of \(self.playedRounds) guesses correct.")
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
    
    func handleAnswerSubmitted(answer: Int) {
        if answer == self.correctCountry {
            self.updateStateForCorrectAnswer()
        } else {
            self.updateStateForWrongAnswer(answer: answer)
        }
        self.playedRounds += 1
        self.showResponse = true
    }
    
    func askQuestion() {
        withAnimation {
            self.correctCountry = Self.getCorrectAnswer()
            self.countries = Self.getCountryArray()
            self.animationOpacity = [1.0, 1.0, 1.0]
            self.animationScale = [1.0, 1.0, 1.0]
        }
        self.responseMessage = ""
    }
    
    func updateStateForCorrectAnswer() {
        self.responseTitle = "Correct"
        self.responseButtonText = "Continue"
        self.score += 1
    }
    
    func updateStateForWrongAnswer(answer: Int) {
        self.responseTitle = "Wrong"
        self.responseButtonText = "New round"
        let selectedCountry = self.countries[answer]
        self.responseMessage = "That was the flag of \(selectedCountry)"
    }
    
    func handleResponseDismissed() {
        print("Game over: \(self.isGameOver())")
        if self.isGameOver() == true {
            self.showGameOver = true
        } else {
            self.askQuestion()
        }
    }
    
    func handleGameOverDismissed() {
        print("Starting new game")
        self.playedRounds = 0
        self.score = 0
        self.askQuestion()
    }
    
    func isGameOver() -> Bool {
        return self.playedRounds >= self.maxRounds
    }
    
    func animateFlagSelection(selectedFlag: Int) {
        withAnimation {
            for i in 0...2 {
                self.animationOpacity[i] = i != selectedFlag ? 0.25 : 1.0
                self.animationScale[i] = i != selectedFlag ? 0.8 : 1.2
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
