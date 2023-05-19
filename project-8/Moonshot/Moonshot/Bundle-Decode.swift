//
//  Bundle-Decode.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/18/23.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load data from \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError("Could not decode data from \(file)")
        }
        
        return decoded
    }
}