//
//  AddHabitView.swift
//  Habits
//
//  Created by Tibor Leupold on 5/26/23.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    @StateObject var habitsData: HabitsData
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: self.$name)
                TextField(
                    "Description",
                    text: self.$description,
                    axis: .vertical
                )
            }
            .navigationTitle(self.getNavigationTitle())
            .toolbar {
                Button("Add") {
                    self.habitsData.habits.append(
                        Habit(
                            name: self.name,
                            description: self.description
                        )
                    )
                    self.dismiss()
                }
            }
        }
    }
    
    func getNavigationTitle() -> String {
        self.name != "" ? self.name : "New habit"
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habitsData: HabitsData())
    }
}
