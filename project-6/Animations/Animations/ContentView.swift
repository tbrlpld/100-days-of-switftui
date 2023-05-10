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
            Button("Click me") {
                self.animationAmount += 1
            }
                .bold()
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(self.animationAmount)
                .blur(radius: (self.animationAmount - 1) * 3)
                .animation(.default, value: self.animationAmount)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
