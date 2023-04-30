//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tibor Leupold on 4/30/23.
//

import SwiftUI


struct TitleStyle: ViewModifier {
    var prefix = ""
    var suffix = ""
    
    func body(content: Self.Content) -> some View {
        HStack {
            if self.prefix != "" {
                Text(self.prefix)
            }
            content
            if self.suffix != "" {
                Text(self.suffix)
            }
        }
            .font(.largeTitle)
            .foregroundColor(.accentColor)
            .bold()
    }
}

extension View {
    func titleStyle(prefix: String = "", suffix: String = "") -> some View {
        modifier(TitleStyle(prefix: prefix, suffix: suffix))
    }
    
}

extension View {
    func makeNothing() -> some View {
        Text("There is nothing here at all")
            .padding()
            .foregroundColor(.white)
            .background(.black)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("The plain text")
                .modifier(TitleStyle())
            Text("The plain text")
                .titleStyle(prefix: "<", suffix: ">")
            Text("The plain text")
                .makeNothing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
