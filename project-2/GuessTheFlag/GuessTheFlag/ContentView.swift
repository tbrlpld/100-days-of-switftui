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
    
    init() {
        self.countries = Self.getCountryArray()
        self.correctCountry = Self.getCorrectAnswer()
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.9, blue: 0.9)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Select the flag of")
                    Text(self.countries[self.correctCountry].uppercased())
                }
                
                ForEach(0..<3) { number in
                    Button {
                        self.checkAnwer(answer: number)
                    } label: {
                        Image(self.countries[number])
                    }
                }
            }
        }.alert(self.message, isPresented: self.$showResponse) {
            Button(self.messageButtonText) {
                self.askQuestion()
            }
        }
    }
    
    static func getCountryArray() -> [String] {
        return ["estonia", "france", "germany", "italy", "ireland", "monaco", "nigeria", "russia", "poland", "spain", "uk", "us"].shuffled()
    }
    
    static func getCorrectAnswer() -> Int {
         return Int.random(in: 0..<3)
    }
    
    func checkAnwer(answer: Int) {
        if answer == self.correctCountry {
            self.setResponseForCorrect()
        } else {
            self.setResponseForWrong()
        }
        self.showResponse = true
    }
    
    func askQuestion() {
        self.countries = Self.getCountryArray()
        self.correctCountry = Self.getCorrectAnswer()
    }
    
    func setResponseForCorrect() {
        self.message = "Correct"
        self.messageButtonText = "Continue"
    }
    
    func setResponseForWrong() {
        self.message = "Wrong"
        self.messageButtonText = "New round"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
