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
        }
        .onSubmit{self.addNewWord()}
    }
    
    func addNewWord() {
        let value = self.newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // Check that the value has some characters in it.
        guard value.count > 0 else { return }
        
        withAnimation {
            self.enteredWords.insert(value, at: 0)
        }
        
        self.newWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
