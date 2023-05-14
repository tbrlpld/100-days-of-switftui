//
//  ContentView.swift
//  iExpense
//
//  Created by Tibor Leupold on 5/14/23.
//

import SwiftUI

struct CustomView: View {
    @State var name: String
    
    var body: some View {
        Text("Hello \( self.name )")
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
