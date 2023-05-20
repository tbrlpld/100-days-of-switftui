//
//  MissionView.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/19/23.
//

import SwiftUI

struct MissionView: View {
    var mission: Mission
    
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
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: self.missions[0])
            .preferredColorScheme(.dark)
    }
}
