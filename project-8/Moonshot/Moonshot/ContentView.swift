//
//  ContentView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    Text("The new screen")
                } label: {
                    Text("Tap me")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
