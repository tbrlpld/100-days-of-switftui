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
        VStack(spacing: 20) {
            Text(self.getRandomHand())
            HStack{
                Text("would")
                Text(self.getMoveLabel())
                Text("against?")
            }
            HStack {
                ForEach(self.hands, id: \.self) {
                    Text($0)
                }
            }
        }
        .padding()
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
