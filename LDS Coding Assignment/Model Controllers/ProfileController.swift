//
//  ProfileController.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/2/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//

import Foundation

class ProfileController {
    
    static let shared = ProfileController()
    
    var profiles: [Profile]?

    func fetchProfiles(completion: @escaping () -> Void) {
        guard let url = URL(string: Keys.baseURLString) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("There was an error fetching Profiles: \(error.localizedDescription)")
                completion()
                return
            }
            guard let data = data else {
                print("No Data from Profile fetch")
                completion()
                return
            }
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let profileArray = jsonDictionary[Keys.profileArrayKey] as? [[String: Any]] else {completion(); return}
            
            var profiles: [Profile] = []
            for dictionary in profileArray {
                guard let profile = Profile(dictionary: dictionary) else {completion(); return}
                profiles.append(profile)
            }
            self.profiles = profiles
            completion()
        }
        dataTask.resume()
    }
    
    func fetchImage(profile: Profile, completion: @escaping () -> Void) {
        guard let url = URL(string: profile.profilePictureURLString) else {completion(); return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("There was an error fetching Image: \(error.localizedDescription)")
                completion()
                return
            }
            guard let data = data else {
                print("No Data from Image fetch")
                completion()
                return
            }
            profile.picture = data as NSData
            completion()
        }
        dataTask.resume()
    }
    
}
