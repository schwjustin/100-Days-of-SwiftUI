//
//  Candy+CoreDataProperties.swift
//  Project 12 - CoreDataProject
//
//  Created by Justin Schwartz on 6/25/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}
