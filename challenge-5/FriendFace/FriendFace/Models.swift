//
//  Models.swift
//  FriendFace
//
//  Created by Tibor Leupold on 6/19/23.
//

import Foundation


struct Person: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: UUID
    var name: String
}
