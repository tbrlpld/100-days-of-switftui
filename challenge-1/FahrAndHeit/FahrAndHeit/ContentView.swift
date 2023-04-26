//
//  ContentView.swift
//  FahrAndHeit
//
//  Created by Tibor Leupold on 4/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Amount")
                    Text("Unit")
                } header: {
                    Text("From")
                }
                
                Section {
                    Text("Unit")
                        
                } header: {
                    Text("TO")
                }
                
                
                Section {
                    Text("Amount")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Fahr & Heit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
