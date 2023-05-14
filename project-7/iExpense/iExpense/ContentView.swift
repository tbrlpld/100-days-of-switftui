//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI

struct CustomView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var name: String
    
    var body: some View {
        Button("Bye \( self.name )") { self.dismiss() }
    }
}

struct ContentView: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            Button("Show sheet") {self.isShowingSheet.toggle()}
        }
        .sheet(isPresented: self.$isShowingSheet) {
            CustomView(name: "World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
