//
//  HabitsData.swift
//  Habits
//
//  Created by Tibor Leupold on 5/26/23.
//

import Foundation


let habitsDataKey = "habits"


class HabitsData: ObservableObject {
    @Published var habits: [Habit] {
        didSet {
            print("Habits were updated, saving to user data.")
            let encoder = JSONEncoder()
            guard let encodedData = try? encoder.encode(self.habits) else {
                print("Could not encode data")
                return
            }
            print(encodedData)
            UserDefaults.standard.set(encodedData, forKey: habitsDataKey)
            print("Done storing data.")
        }
    }
    
    init() {
        let defaultHabits = [Habit]()
        
        guard let encodedData = UserDefaults.standard.data(forKey: habitsDataKey) else {
            print("Could not load data from user defaults")
            self.habits = defaultHabits
            return
        }
        
        let decoder = JSONDecoder()
        guard let data = try? decoder.decode([Habit].self, from: encodedData) else {
            print("Could not decode data from user defaults")
            self.habits = defaultHabits
            return
        }
        
        self.habits = data
    }
    
    init(habits: [Habit] = [Habit]()) {
        self.habits = habits
    }
    
}
