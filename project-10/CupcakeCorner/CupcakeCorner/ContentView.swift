//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/28/23.
//

import SwiftUI


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(self.results, id: \.trackId) { result in
            VStack {
                Text(result.trackName)
            }
        }
        .task {
            print("Staring background tasks.")
            await self.getSongs()
        }
    }
    
    func getSongs() async {
        print("Getting songs.")
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylow+swift&entity=song") else {
            print("Bad URL")
            return
        }
        
        guard let (JSONData, _) = try? await URLSession.shared.data(from: url) else {
            print("Connection error.")
            return
        }
        print(String(data: JSONData, encoding: .utf8) ?? "")
        
        let decoder = JSONDecoder()
        guard let data = try? decoder.decode(Response.self, from: JSONData) else {
            print("Decoding issue.")
            return
        }
        
        self.results = data.results
        
        print("Done getting songs.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
