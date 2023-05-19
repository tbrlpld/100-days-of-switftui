//
//  ContentView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        VStack{
            Text("\(self.astronauts.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
