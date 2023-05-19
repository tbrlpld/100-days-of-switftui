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
    
    let layout = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: self.layout){
                    ForEach(self.missions) { mission in
                        VStack {
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.launchDate ?? "N/A")
                                .font(.subheadline)
                        }
                        .padding(20)
                    }
                    .frame(maxWidth: .infinity)
                    .navigationTitle("Moonshot")
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
