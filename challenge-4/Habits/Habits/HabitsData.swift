//
//  HabitsData.swift
//  Habits
//
//  Created by Tibor Leupold on 5/26/23.
//

import Foundation

class HabitsData: ObservableObject {
    @Published var habits = [Habit]()
}
