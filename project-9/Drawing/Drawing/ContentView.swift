//
//  ContentView.swift
//  Drawing
//
//  Created by Tibor Leupold on 5/22/23.
//

import SwiftUI

struct Flower: Shape {
    var petalWidth = 100.0
    var offset = 0.0
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: 2 * Double.pi, by: Double.pi / 8) {
            print(number)
            let originalPetal = Path(ellipseIn: CGRect(x: -self.petalWidth / 2, y: 0, width: self.petalWidth, height: min(rect.width, rect.height) / 2.0 ))
            
            // Offset from the rotation point (this created the center of the flower)
            let rotationPointOffset = CGAffineTransform(translationX: self.offset, y: 0)
            // Rotates around the zero point
            let rotation = CGAffineTransform(rotationAngle: number)
            // Move to the center of the rect angle
            let translateToCenter = CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2)
            let transformation = rotationPointOffset.concatenating(rotation).concatenating(translateToCenter)
            
            let transformedPetal = originalPetal.applying(transformation)
            
            path.addPath(transformedPetal)
        }
        
        return path
    }
}


struct ContentView: View {
    @State private var offset = 0.0
    @State private var width = 100.0
    
    var body: some View {
        VStack {
            Flower(petalWidth: self.width, offset: self.offset)
                .stroke(.red)
                .frame(height: 300)
            
            VStack{
                Text("Offset")
                Slider(value: self.$offset, in: -100...100.0)
            }
            .padding()
            
            VStack{
                Text("Width")
                Slider(value: self.$width, in: 0...400.0)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
