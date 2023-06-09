//
//  ContentView.swift
//  Habits
//
//  Created by Tibor Leupold on 5/26/23.
//

import SwiftUI


struct ContentView: View {
    @State private var isShowingAddHabitView = false
    @ObservedObject var habitsData = HabitsData()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitsData.habits) { habit in
                    NavigationLink {
                        HabitDetailView(habit: habit)
                            .navigationTitle(habit.name)
                            .navigationBarTitleDisplayMode(.large)
                    } label: {
                        Text(habit.name)
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button("New") {
                    self.isShowingAddHabitView = true
                }
            }
            .sheet(isPresented: self.$isShowingAddHabitView) {
                AddHabitView(habitsData: self.habitsData)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            habitsData: HabitsData(
                habits: [
                    Habit(name: "This", description: ""),
                    Habit(name: "That", description: "")
                ]
            )
        )
    }
}
