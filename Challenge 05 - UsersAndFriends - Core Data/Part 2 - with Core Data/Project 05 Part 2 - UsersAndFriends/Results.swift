//
//  Results.swift
//  Project 05 Part 2 - UsersAndFriends
//
//  Created by Justin Schwartz on 6/27/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import Foundation

struct Result: Codable, Identifiable {
    struct userFriends: Codable, Identifiable {
        var id: UUID
        var name: String
    }
    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [userFriends]
}
