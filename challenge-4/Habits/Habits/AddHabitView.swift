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
    
    var body: some View {
        NavigationView {
            Form {
                TextField(text: self.$name) {
                    Text("Name")
                }
                
            }
            .navigationTitle(self.getNavigationTitle())
            .toolbar {
                Button("Add") {
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
        AddHabitView()
    }
}
