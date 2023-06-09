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
    
    @State private var isShowingAsList = true
    
    var body: some View {
        NavigationView {
            Group {
                if self.isShowingAsList {
                    self.listView
                } else {
                    self.gridView
                }
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
            .toolbar{
                Button {
                    self.isShowingAsList.toggle()
                } label: {
                    if self.isShowingAsList {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    } else {
                        Label("Show as grid", systemImage: "list.dash")
                    }
                }
            }
            .background(.darkBackground)
        }
    }
    
    var gridView: some View {
        ScrollView {
            LazyVGrid(columns: self.layout){
                ForEach(self.missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: self.astronauts)
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
    }
    
    var listView: some View {
        List {
            ForEach(self.missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: self.astronauts)
                } label: {
                    HStack(spacing: 20) {
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.displayLaunchDate)
                                .font(.subheadline)
                                .opacity(0.8)
                        }
                    }
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
