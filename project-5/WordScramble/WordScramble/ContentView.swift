//
//  ContentView.swift
//  WordScramble
//
//  Created by Tibor Leupold on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var enteredWords = [String]()
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    TextField("Enter new word", text: self.$newWord)
                        .autocapitalization(.none)
                } header: {
                    Text("Make new words from the letters in '\(self.rootWord)'")
                }
                
                Section {
                    ForEach(self.enteredWords, id: \.self) { word in
                        HStack {
                            Text(word)
                            Spacer()
                            Image(systemName: "\(word.count).circle")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle(self.rootWord)
        }
        .onAppear(perform: self.startGame)
        .onSubmit(self.addNewWord)
    }
    
    func addNewWord() {
        print("New word submitted")
        let value = self.newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // Check that the value has some characters in it.
        guard value.count > 0 else { return }
        
        withAnimation {
            self.enteredWords.insert(value, at: 0)
        }
        
        self.newWord = ""
    }
    
    func startGame() {
        print("Starting")
        guard let startWordsURL = Bundle.main.url(forResource: "start-words", withExtension: "txt") else {
            fatalError("Could find 'start-words.txt'.")
        }
        
        guard let startWordsContent = try? String(contentsOf: startWordsURL) else {
            fatalError("Could not load contents of 'start-words.txt'.")
        }
        
        let startWords = startWordsContent.components(separatedBy: "\n")
        self.rootWord = startWords.randomElement() ?? "silkworm"
        print(self.rootWord)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
