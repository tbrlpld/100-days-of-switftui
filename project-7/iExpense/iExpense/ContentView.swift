//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    var body: some View {
        VStack {
            Button("Store user") {
                let encoder = JSONEncoder()
                
                guard let data = try? encoder.encode(user) else {
                    print("Something is off")
                    return
                }
                
                UserDefaults.standard.set(data, forKey: "user")
                print("stored")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
