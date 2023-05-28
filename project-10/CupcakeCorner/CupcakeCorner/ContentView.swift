//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/28/23.
//

import SwiftUI


class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Jane Doe"
    
    required init(from decoder: Decoder) throws {
        // Get the decoded data where we expect the data to have all the keys from our "CodingKeys" enum.
        let container = try decoder.container(keyedBy: Self.CodingKeys.self)
        // Set the object values from the decoded data.
        self.name = try container.decode(String.self, forKey: Self.CodingKeys.name)
    }
    
    func encode(to encoder: Encoder) throws {
        // Create a container for the data we want to encode from the encoder that needs to be able to hold all the keys defined in our coding keys enum.
        var container = try encoder.container(keyedBy: Self.CodingKeys.self)
        // Encode the individual values.
        try container.encode(self.name, forKey: Self.CodingKeys.name)
        
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
