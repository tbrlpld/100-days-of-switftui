//
//  ContentView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        LazyVGrid(columns: self.layout) {
            ForEach(0..<100) {
                Text("Item \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
