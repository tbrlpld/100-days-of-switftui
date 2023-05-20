//
//  MissionView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/19/23.
//
import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct CrewMemberView: View {
    let crewMember: CrewMember
    
    var body: some View {
        HStack{
            Image(self.crewMember.astronaut.id)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .clipped()
            
            VStack(alignment: .leading) {
                Text(self.crewMember.astronaut.name)
                    .font(.headline)
                
                Text(self.crewMember.role)
                    .font(.subheadline)
                    .opacity(0.8)
            }
        }
        .foregroundColor(.primary)
    }
}

struct MissionView: View {
    var mission: Mission
    var crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    VStack {
                        Image(self.mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.6)
                        
                        if let launchDate = self.mission.launchDate  {
                            Text(launchDate.formatted(date: .long, time: .omitted))
                                .padding(.top, 15)
                        }
                    }
                    .padding(.bottom, 15)
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(self.mission.description)
                        
                        Text("Crew")
                            .padding(.top, 15)
                            .font(.title.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            ForEach(self.crew, id: \.astronaut.id) { crew in
                                NavigationLink {
                                    AstronautView(astronaut: crew.astronaut)
                                } label: {
                                    CrewMemberView(crewMember: crew)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle(self.mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = self.mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(
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
        MissionView(mission: self.missions[1], astronauts: self.astronauts)
            .preferredColorScheme(.dark)
    }
}
