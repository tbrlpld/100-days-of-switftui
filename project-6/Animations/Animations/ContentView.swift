//
//  ContentView.swift
//  Animations
//
//  Created by Tibor Leupold on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation(
                    .interpolatingSpring(stiffness: 50, damping: 5)
                ) {
                    animationAmount += 360
                }
            }
                .bold()
                .padding(50)
                .background(.red)
                .clipShape(Circle())
                .foregroundColor(.white)
                .rotation3DEffect(.degrees(self.animationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
