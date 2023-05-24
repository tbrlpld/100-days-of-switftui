//
//  ContentView.swift
//  Drawing
//
//  Created by Tibor Leupold on 5/22/23.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(
                    ImagePaint(
                        image: Image("example"),
                        sourceRect: CGRect(x: 0.2, y: 0.2, width: 0.8, height: 0.8),
                        scale: 1
                    ),
                    width: 30
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
