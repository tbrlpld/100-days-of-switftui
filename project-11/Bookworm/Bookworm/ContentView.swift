//
//  ContentView.swift
//  Bookworm
//
//  Created by Tibor Leupold on 6/2/23.
//

import SwiftUI


struct CustomButton: View {
    @Binding var isOn: Bool
   
    var body: some View {
        Button("Tap me"){
            self.isOn.toggle()
        }
        .padding()
        .background(self.isOn ? .red : .blue)
        .foregroundColor(.white)
    }
}

struct ContentView: View {
    @State var rememberMe = false
    
    var body: some View {
        VStack {
            CustomButton(isOn: self.$rememberMe)
            Text(self.rememberMe ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
