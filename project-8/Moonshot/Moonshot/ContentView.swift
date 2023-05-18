//
//  ContentView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("example")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipped()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
