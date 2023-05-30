//
//  Order.swift
//  CupcakeCorner
//
//  Created by Tibor Leupold on 5/29/23.
//

import SwiftUI


class Order: ObservableObject {
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
}
