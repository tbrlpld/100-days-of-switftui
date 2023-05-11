//
//  ContentView.swift
//  Animations
//
//  Created by Tibor Leupold on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                self.enabled.toggle()
            }
                .bold()
                .padding(50)
                .foregroundColor(.white)
                .background(self.enabled ? .blue : .red)
                .animation(.easeInOut(duration: 1), value: self.enabled)
                .clipShape(RoundedRectangle(cornerRadius: self.enabled ? 0 : 20))
                .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: self.enabled)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
