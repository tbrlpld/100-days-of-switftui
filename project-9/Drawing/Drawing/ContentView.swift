//
//  ContentView.swift
//  Drawing
//
//  Created by Tibor Leupold on 5/22/23.
//

import SwiftUI


struct Arrow: Shape {
    var lineWidth = 10.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY - lineWidth))
        path.addLine(to: CGPoint(x: rect.maxX - 9 * lineWidth, y: rect.midY - lineWidth))
        path.addLine(to: CGPoint(x: rect.maxX - 9 * lineWidth, y: rect.midY - 3 * lineWidth))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 9 * lineWidth, y: rect.midY + 3 * lineWidth))
        path.addLine(to: CGPoint(x: rect.maxX - 9 * lineWidth, y: rect.midY + lineWidth))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY + lineWidth))
        path.closeSubpath()
        
        return path
    }
}


struct ContentView: View {
    @State private var arrowLineWidth = 4.0
    
    var body: some View {
        VStack {
            Arrow(lineWidth: self.arrowLineWidth)
                .fill(.black)
                .onTapGesture {
                    self.arrowLineWidth *= 2
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
