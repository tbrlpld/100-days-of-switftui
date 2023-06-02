//
//  Order.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI

class OrderData: ObservableObject {
    @Published var order = Order()
}


struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var enableSpecialRequests = false {
        didSet {
            if self.enableSpecialRequests == false {
                self.addSprinkles = false
                self.extraFrosting = false
            }
        }
    }
    var addSprinkles = false
    var extraFrosting = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
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
