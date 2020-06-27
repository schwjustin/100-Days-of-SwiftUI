//
//  Friends+CoreDataProperties.swift
//  Project 05 Part 2 - UsersAndFriends
//
//  Created by Justin Schwartz on 6/27/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//
//

import Foundation
import CoreData


extension CDFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFriend> {
        return NSFetchRequest<CDFriend>(entityName: "CDFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CDResult?

    public var wrappedId: String {
        id ?? "Unknown id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    // MARK: Generated accessors for user
    extension CDResult {

        @objc(addUserObject:)
        @NSManaged public func addToUser(_ value: CDUser)

        @objc(removeUserObject:)
        @NSManaged public func removeFromUser(_ value: CDUser)

        @objc(addUser:)
        @NSManaged public func addToUser(_ values: NSSet)

        @objc(removeUser:)
        @NSManaged public func removeFromUser(_ values: NSSet)

    }
}
