//
//  Keys.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/2/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//

import Foundation

struct Keys {
    
    static let baseURLString = "https://edge.ldscdn.org/mobile/interview/directory"
    
    
    // View Keys
    static let profileCellIdentifier = "profileCell"
    static let segueIdentifierToDetailVC = "toDetailProfileVC"
    
    // Parsong Profile JSon Keys
    static let idKey = "id"
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let birthdateKey = "birthdate"
    static let profilePictureKey = "profilePicture"
    static let forceSensitiveKey = "forceSensitive"
    static let affiliationKey = "affiliation"
    static let profileArrayKey = "individuals"
}
