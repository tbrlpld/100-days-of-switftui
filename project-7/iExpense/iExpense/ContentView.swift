//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(self.user.firstName) \(self.user.lastName)")
            
            TextField("First name", text: self.$user.firstName)
            TextField("Last name", text: self.$user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
