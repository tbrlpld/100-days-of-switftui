//
//  ContentView.swift
//  Animations
//
//  Created by Tibor Leupold on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingCard = false
    
    var body: some View {
        Button("Tap me") {
            withAnimation{
                self.isShowingCard.toggle()
            }
        }
        
        if self.isShowingCard {
            LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .transition(.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
