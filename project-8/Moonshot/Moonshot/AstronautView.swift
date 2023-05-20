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
        ScrollView {
            VStack {
                Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(self.astronaut.description)
                    .padding()
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(self.astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .foregroundColor(.primary)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: self.astronauts["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}
