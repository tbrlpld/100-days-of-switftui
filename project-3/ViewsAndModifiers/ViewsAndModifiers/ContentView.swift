//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tibor Leupold on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.orange)
            .padding()
            .background(.yellow)
            .padding()
            .background(.green)
            .padding()
            .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
