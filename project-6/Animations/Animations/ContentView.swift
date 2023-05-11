//
//  ContentView.swift
//  Animations
//
//  Created by Tibor Leupold on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(self.dragAmount)
            .gesture(
                DragGesture()
                    .onChanged() { self.dragAmount = $0.translation }
                    .onEnded() { _ in self.dragAmount = .zero }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
