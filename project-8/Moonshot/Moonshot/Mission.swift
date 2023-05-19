//
//  Mission.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/18/23.
//

import Foundation


struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [CrewRole]
    let launchDate: Date?
    let description: String
    
    var displayName: String {
        "Apollo \(self.id)"
    }
    
    var imageName: String {
        "apollo\(self.id)"
    }
    
    var displayLaunchDate: String {
        self.launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
