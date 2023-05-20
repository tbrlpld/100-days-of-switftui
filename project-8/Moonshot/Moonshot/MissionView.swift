//
//  MissionView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/19/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    var mission: Mission
    var crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(self.mission.imageName)
                        .resizable()
                        .scaledToFit()
                       .frame(width: geo.size.width * 0.6)
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(self.mission.description)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(self.mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = self.mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return Self.CrewMember(
                    role: member.role,
                    astronaut: astronaut
                )
            } else {
                fatalError("Could not find astronaut data for \(member.name)")
            }
        }
        
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: self.missions[0], astronauts: self.astronauts)
            .preferredColorScheme(.dark)
    }
}
