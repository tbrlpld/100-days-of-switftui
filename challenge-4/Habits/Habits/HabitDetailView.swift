//
//  HabitDetailView.swift
//  Habits
//
//  Created by Tibor Leupold on 5/27/23.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.habit.name)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 15)
            Text(self.habit.description)
                .font(.subheadline)
            Spacer()
            Text("Actions go here.")
            Spacer()
        }
        .padding(10)
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var habit: Habit {
         return Habit(
            name: "Workout",
            description: "Count every time I am inside the gym regardless of what I do there."
        )
    }
    
    static var previews: some View {
        NavigationView {
            HabitDetailView(habit: self.habit)
//                .navigationTitle(self.habit.name)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
