//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Tibor Leupold on 5/2/23.
//

import SwiftUI

let rock = "Rock"
let paper = "Paper"
let scissors = "Scissors"

struct ContentView: View {
    let hands = [rock, paper, scissors]
    
    @State var moveIsWin = Bool.random()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Rock, Paper, Knowledge")
                .font(.title).bold()
            Spacer()
            VStack(spacing: 20) {
                Text(self.getRandomHand())
                    .font(.title).fontWeight(.bold)
                Text("would")
                Text(self.getMoveLabel())
                    .font(.title2).fontWeight(.bold)
                Text("against?")
                HStack(spacing: 30) {
                    ForEach(self.hands, id: \.self) { hand in
                        Button(hand) {
                            print("Selected \(hand)")
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
    
    func getRandomHand() -> String {
        print("Getting random hand.")
        let hand = self.hands.randomElement()!
        print("-> \(hand)")
        return hand
    }
    
    func getMoveLabel() -> String {
        if self.moveIsWin {
            return "win"
        }
        return "loose"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
