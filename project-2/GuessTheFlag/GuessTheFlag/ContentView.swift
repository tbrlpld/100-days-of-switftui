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
            LinearGradient(colors: [Color(red: 0.95, green: 0.95, blue: 0.95), Color(red: 0.8, green: 0.8, blue: 0.8)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Select the flag of")
                        .font(.headline.weight(.heavy))
                    Text(self.countries[self.correctCountry])
                        .font(.largeTitle.weight(.bold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        self.checkAnwer(answer: number)
                    } label: {
                        Image(self.countries[number].lowercased())
                            .clipShape(Rectangle()).cornerRadius(5)
                            .shadow(radius: 10, x: 2, y: 3)
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
        return ["Estonia", "France", "Germany", "Italy", "Ireland", "Monaco", "Nigeria", "Russia", "Poland", "Spain", "UK", "US"].shuffled()
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
