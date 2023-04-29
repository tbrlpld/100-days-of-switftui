//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tibor Leupold on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    var countries = ["estonia", "france", "germany", "italy", "ireland", "monaco", "nigeria", "russia", "poland", "spain", "uk", "us"]
    var correctCountry = Int.random(in: 0...2)
    
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
                        print("Add button")
                    } label: {
                        Image(self.countries[number])
                    }
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
