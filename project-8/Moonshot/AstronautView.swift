//
//  AstronautView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/20/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        Text(self.astronaut.name)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: self.astronauts["aldrin"]!)
    }
}
