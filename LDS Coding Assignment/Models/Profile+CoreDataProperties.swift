//
//  Profile+CoreDataProperties.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/2/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var affiliation: String
    @NSManaged public var birthdate: String
    @NSManaged public var firstName: String
    @NSManaged public var forceSensitive: Bool
    @NSManaged public var id: Int16
    @NSManaged public var lastName: String
    @NSManaged public var picture: NSData?
    @NSManaged public var profilePictureURLString: String

}
