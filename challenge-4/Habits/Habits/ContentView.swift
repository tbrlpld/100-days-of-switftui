//
//  ContentView.swift
//  Habits
//
//  Created by Tibor Leupold on 5/26/23.
//

import SwiftUI

struct AddHabitView: View {
    var hideAction: () -> Void
    
    var body: some View {
        Text("Hello too")
            .onTapGesture {
                self.hideAction()
            }
    }
    
}

struct ContentView: View {
    @State private var isShowingAddHabitView = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onTapGesture {
            self.isShowingAddHabitView = true
        }
        .padding()
        .sheet(isPresented: self.$isShowingAddHabitView) {
            AddHabitView { self.isShowingAddHabitView = false }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
