//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/28/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading image.")
            } else {
                // Not loaded, not error -> loading
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
