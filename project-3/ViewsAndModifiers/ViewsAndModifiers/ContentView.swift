//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tibor Leupold on 4/30/23.
//

import SwiftUI

struct TextCapsule: View {
    var text: String
    
    var body: some View {
        Text(self.text)
            .padding(20)
            .frame(minWidth: 100)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            TextCapsule(text: "This")
            TextCapsule(text: "That")
            TextCapsule(text: "And one with another modifier")
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
