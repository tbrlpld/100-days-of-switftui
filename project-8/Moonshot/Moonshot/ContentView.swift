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
                        NavigationLink {
                            Text("Test")
                        } label: {
                            VStack {
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.displayLaunchDate)
                                    .font(.subheadline)
                                    .opacity(0.8)
                            }
                            .foregroundColor(.primary)
                            .padding(20)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
