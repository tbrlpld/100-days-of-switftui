//
//  Order.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI


class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type
        case quantity
        case addSprinkles
        case extraFrosting
        case name
        case streetAddress
        case city
        case zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var enableSpecialRequests = false {
        didSet {
            if self.enableSpecialRequests == false {
                self.addSprinkles = false
                self.extraFrosting = false
            }
        }
    }
    @Published var addSprinkles = false
    @Published var extraFrosting = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    init () {
        // Noop initializer for a default object.
    }
    
    required init(from decoder: Decoder) throws {
        // Initialize object with data from decoder.
        let container = try decoder.container(keyedBy: Self.CodingKeys.self)

        self.type = try container.decode(Int.self, forKey: .type)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
        
        self.addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        self.extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.streetAddress = try container.decode(String.self, forKey: .streetAddress)
        self.city = try container.decode(String.self, forKey: .city)
        self.zip = try container.decode(String.self, forKey: .zip)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Self.CodingKeys.self)
        
        try container.encode(self.type, forKey: .type)
        try container.encode(self.quantity, forKey: .quantity)
        
        try container.encode(self.addSprinkles, forKey: .addSprinkles)
        try container.encode(self.extraFrosting, forKey: .extraFrosting)
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.streetAddress, forKey: .streetAddress)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.zip, forKey: .zip)
    }
    
    var cost: Double {
        // $2 base cost per cupcake
        var costEach = 2.0
        
        // $1 extra for Chocolate and Rainbow
        if self.type > 1 {
            costEach += 1.0
        }
        
        if self.addSprinkles {
            costEach += 0.5
        }
        
        if self.extraFrosting {
            costEach += 1.0
        }
        
        return Double(self.quantity) * costEach
    }
    
    func isAddressValid() -> Bool {
        if (
            self.stringIsNotEmpty(self.name)
            && self.stringIsNotEmpty(self.streetAddress)
            && self.stringIsNotEmpty(self.city)
            && self.stringIsNotEmpty(self.zip)
        ) {
            return true
        }
        return false
    }
    
    func stringIsNotEmpty(_ string: String) -> Bool {
        return !string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
