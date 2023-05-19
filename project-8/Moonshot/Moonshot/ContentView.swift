//
//  ContentView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(self.missions) { mission in
                    VStack{
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.launchDate ?? "N/A")
                            .font(.subheadline)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
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
