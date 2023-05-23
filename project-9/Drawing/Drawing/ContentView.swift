//
//  ContentView.swift
//  Drawing
//
//  Created by Tibor Leupold on 5/22/23.
//

import SwiftUI

struct Triangle: InsettableShape {
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY + self.insetAmount))
        path.addLine(to: CGPoint(x: rect.minX + self.insetAmount, y: rect.maxY - self.insetAmount))
        path.addLine(to: CGPoint(x: rect.maxX - self.insetAmount, y: rect.maxY - self.insetAmount))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + self.insetAmount))
        path.closeSubpath()
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var triangle = self
        triangle.insetAmount = amount
        return triangle
    }
}


struct ContentView: View {
    var body: some View {
        Triangle()
//            .stroke(.red, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
            .strokeBorder(.red, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
            .frame(height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
