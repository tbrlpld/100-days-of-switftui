//
//  ContentView.swift
//  Drawing
//
//  Created by Tibor Leupold on 5/22/23.
//

import SwiftUI


struct Checkerboard: Shape {
    var rows = 4
    var columns = 4
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatableData(Double(self.rows), Double(self.columns))
        }
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let fieldWidth = rect.width / Double(columns)
        let fieldHeight = rect.height / Double(rows)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = Double(column) * fieldWidth
                    let startY = Double(row) * fieldHeight
                    path.addRect(CGRect(x: startX, y: startY, width: fieldWidth, height: fieldHeight))
                }
            }
        }
        
        
        return path
    }
}


struct ContentView: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        VStack {
            Checkerboard(rows: self.rows, columns: self.columns)
                .frame(width: 300, height: 300)
                .border(.black)
                .onTapGesture {
                    withAnimation{
                        self.rows *= 2
                        self.columns *= 2
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
