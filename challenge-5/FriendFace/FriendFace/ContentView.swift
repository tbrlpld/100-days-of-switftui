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
        .onAppear(perform: self.triggerDataLoad)
    }

    func triggerDataLoad() -> Void {
        Task {
            await self.loadData()
        }
    }

    func loadData() async -> Void {
        print("Loading...")
        let friendFaceEndpoint = "https://www.hackingwithswift.com/samples/friendface.json"

        guard let url = URL(string: friendFaceEndpoint) else {
            fatalError("Could not generate URL from endpoint string.")
        }


        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            fatalError("Could not retrieve data from endpoint.")
        }

        print("Done loading.")

//        print(String(decoding: data, as: UTF8.self))

        print("Decoding")

        let decoder = JSONDecoder()
        guard let people = try? decoder.decode([Person].self, from: data) else {
//            fatalError("Coud not decode response data.")
            print("Could not decode.")
            return
        }

        print("Done decoding.")

        print("Got \(people.count) people")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


