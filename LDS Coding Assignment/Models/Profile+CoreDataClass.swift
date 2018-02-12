//
//  Profile+CoreDataClass.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/2/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Profile)
public class Profile: NSManagedObject {
    
    var image: UIImage? {
        guard let data = picture as? Data else {return nil}
        return UIImage(data: data)
    }
    
    convenience init?(dictionary: [String: Any], context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        guard let id = dictionary[Keys.idKey] as? Int16,
            let firstName = dictionary[Keys.firstNameKey] as? String,
            let lastName = dictionary[Keys.lastNameKey] as? String,
            let birthdate = dictionary[Keys.birthdateKey] as? String,
            let affiliation = dictionary[Keys.affiliationKey] as? String,
            let profilePictureURLString = dictionary[Keys.profilePictureKey] as? String,
            let forceSensitive = dictionary[Keys.forceSensitiveKey] as? Bool else {return nil}
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.affiliation = affiliation
        self.forceSensitive = forceSensitive
        self.profilePictureURLString = profilePictureURLString
    }
}
