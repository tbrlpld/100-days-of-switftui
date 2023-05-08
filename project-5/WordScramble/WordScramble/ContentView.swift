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
    
    @State private var wordErrorTitle = ""
    @State private var wordErrorMessage = ""
    @State private var showWordError = false
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    TextField("Enter new word", text: self.$newWord)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
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
            .toolbar {
                Button("New word") { self.startGame() }
            }
        }
        .onAppear(perform: self.startGame)
        .onSubmit(self.addNewWord)
        .alert(self.wordErrorTitle, isPresented: self.$showWordError) {
            Button("Ok", role: .cancel) {}
        } message: {
            Text(self.wordErrorMessage)
        }
    }
    
    func startGame() {
        print("Starting")
        self.enteredWords = [String]()
        
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
    
    func addNewWord() {
        print("New word submitted")
        let value = self.newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // Check that the value has some characters in it.
        guard value.count > 0 else { return }
        
        guard self.isOriginal(word: value) else {
            self.wordError(title: "Already used", message: "Be more original.")
            return
        }
        
        guard self.isPossible(word: value) else {
            self.wordError(title: "Not possible", message: "You can not build '\(value)' from '\(self.rootWord)'")
            return
        }
        
        guard self.isLongEnough(word: value) else {
            self.wordError(title: "Too short", message: "Let's try a longer word.")
            return
        }
        
        guard self.isDifferentFromRootWord(word: value) else {
            self.wordError(title: "Same as root word", message: "Come on, don't be lazy.")
            return
        }
        
        guard self.isRealWord(word: value) else {
            self.wordError(title: "Not a word", message: "You have to use real words, right?!")
            return
        }
         
        withAnimation {
            self.enteredWords.insert(value, at: 0)
        }
        
        self.newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        !self.enteredWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var referenceWord = self.rootWord
        for letter in word {
            if let pos = referenceWord.firstIndex(of: letter) {
                // If the letter was found, remove it from the reference word.
                referenceWord.remove(at: pos)
            } else {
                // If the letter was not found in the reference, the word is invalid.
                return false
            }
        }
        return true
    }
    
    func isLongEnough(word: String) -> Bool {
        return word.count > 3
    }
    
    func isDifferentFromRootWord(word: String) -> Bool {
        return word != self.rootWord
    }
    
    func isRealWord(word: String) -> Bool {
        let range = NSRange(location: 0, length: word.count)
        let checker = UITextChecker()
        let misspelledWord = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        let isErrorFree = misspelledWord.location == NSNotFound
        return isErrorFree
    }
    
    func wordError(title: String, message: String) {
        self.wordErrorTitle = title
        self.wordErrorMessage = message
        self.showWordError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
