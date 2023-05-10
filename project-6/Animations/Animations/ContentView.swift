//
//  ContentView.swift
//  Animations
//
//  Created by Tibor Leupold on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Stepper(
                "Change size",
                value: self.$animationAmount.animation(
                    .easeIn(duration: 1)
                )
            )
            Spacer()
            Button("Click me") { }
                .bold()
                .padding(50)
                .background(.red)
                .clipShape(Circle())
                .foregroundColor(.white)
                .scaleEffect(self.animationAmount)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
