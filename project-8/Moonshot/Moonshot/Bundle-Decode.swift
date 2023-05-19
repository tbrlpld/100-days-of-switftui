//
//  Bundle-Decode.swift
//  Moonshot
//
//  Created by Tibor Leupold on 5/18/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load data from \(file)")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-DD"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode data from \(file)")
        }
        
        return decoded
    }
}
