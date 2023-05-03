//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Tibor Leupold on 5/2/23.
//

import SwiftUI


//  Each turn of the game the app will randomly pick either rock, paper, or scissors.
//  Each turn the app will alternate between prompting the player to win or lose.
//  The player must then tap the correct move to win or lose the game.
//  If they are correct they score a point; otherwise they lose a point.
//  The game ends after 10 questions, at which point their score is shown.

let rock = "Rock"
let paper = "Paper"
let scissors = "Scissors"

struct ContentView: View {
    static let hands = [rock, paper, scissors]
    
    @State var challengerHand: String
    @State var isMoveWin = Bool.random()
    
    init() {
        self.challengerHand = Self.getRandomHand()
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Rock, Paper, Knowledge")
                .font(.title).bold()
            Spacer()
            VStack(spacing: 20) {
                Text(self.challengerHand)
                    .font(.title).fontWeight(.bold)
                Text("would")
                Text(self.getMoveLabel())
                    .font(.title2).fontWeight(.bold)
                Text("against?")
                HStack(spacing: 30) {
                    ForEach(Self.hands, id: \.self) { hand in
                        Button(hand) {
                            print("Selected \(hand)")
                            handleHandPicked(picked: hand)
                        }
                        .bold()
                    }
                }
                .padding(30)
            }
            .padding()
            Spacer()
            Spacer()
        }
    }
    
    static func getRandomHand() -> String {
        let hand = Self.hands.randomElement()!
        print("Getting random hand: \(hand)")
        return hand
    }
    
    func askQuestion() {
        print()
        self.isMoveWin.toggle()
        self.challengerHand = Self.getRandomHand()
    }
    
    func getMoveLabel() -> String {
        if self.isMoveWin {
            return "win"
        }
        return "loose"
    }
    
    func handleHandPicked(picked: String) {
        let result: Bool
        if self.isMoveWin {
            result = self.wouldWinAgainst(challenger: self.challengerHand, incumbent: picked)
        } else {
            result = self.wouldLooseAgainst(challenger: self.challengerHand, incumbent: picked)
        }
        self.askQuestion()
    }
    
    func wouldWinAgainst(challenger: String, incumbent: String) -> Bool {
        print("\(challenger) would WIN against \(incumbent):")
        if (
            (challenger == rock && incumbent == scissors)
            || (challenger == scissors && incumbent == paper)
            || (challenger == paper && incumbent == rock)
        ) {
            print("TRUE")
            return true
        }
        print("FALSE")
        return false
    }
    
    func wouldLooseAgainst(challenger: String, incumbent: String) -> Bool {
        print("\(challenger) would LOOSE against \(incumbent):")
        if (
            (challenger == scissors && incumbent == rock)
            || (challenger == paper && incumbent == scissors)
            || (challenger == rock && incumbent == paper)
        ) {
            print("TRUE")
            return true
        }
        print("FALSE")
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
