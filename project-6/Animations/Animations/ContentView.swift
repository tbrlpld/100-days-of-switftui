//
//  ContentView.swift
//  Animations
//
//  Created by Tibor Leupold on 5/9/23.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let corner: UnitPoint
    let angle: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(self.angle), anchor: self.corner)
            .clipped()
    }
    
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(corner: .topLeading, angle: 90),
            identity: CornerRotateModifier(corner: .topLeading, angle: 0)
        )
    }
}

struct ContentView: View {
    @State private var isShowingCard = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation{
                    self.isShowingCard.toggle()
                }
            }
            
            if self.isShowingCard {
                LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .transition(.pivot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
