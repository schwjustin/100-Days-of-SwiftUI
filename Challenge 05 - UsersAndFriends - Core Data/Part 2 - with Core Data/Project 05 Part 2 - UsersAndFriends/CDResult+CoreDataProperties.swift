//
//  CDResult+CoreDataProperties.swift
//  Project 05 Part 2 - UsersAndFriends
//
//  Created by Justin Schwartz on 6/27/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//
//

import Foundation
import CoreData


extension CDResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDResult> {
        return NSFetchRequest<CDResult>(entityName: "CDResult")
    }

    @NSManaged public var company: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown company"
    }
    
    /*
    public var friendArray: [CDFriend] {
        let set = friends as? Set<CDFriend> ?? []

        return set.sorted {
            $0.wrappedId < $1.wrappedId
        }
    }*/
}
