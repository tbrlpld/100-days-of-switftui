//
//  Habit.swift
//  Habits
//
//  Created by Tibor Leupold on 5/26/23.
//

import Foundation


struct Habit: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    
    init(name: String, description: String) {
        self.id = UUID()
        self.name = name
        self.description = description
    }
}
