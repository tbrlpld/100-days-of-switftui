//
//  ContentView.swift
//  FriendFace
//
//  Created by Tibor Leupold on 6/18/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    var body: some View {
        VStack{
            Text("Hello World")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
