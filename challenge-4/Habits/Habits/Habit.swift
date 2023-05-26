//
//  Habit.swift
//  Habits
//
//  Created by Tibor Leupold on 5/26/23.
//

import Foundation


struct Habit: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}
