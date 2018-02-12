//
//  ProfileController.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/2/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//

import Foundation
import CoreData

class ProfileController {
    
    static let shared = ProfileController()
    
    var profiles: [Profile]? {
        return loadProfiles()
    }

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
            
            for dictionary in profileArray {
                guard let profile = Profile(dictionary: dictionary) else {completion(); return}
                self.saveToUserPersistentStore()
            }
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
            self.saveToUserPersistentStore()
            completion()
        }
        dataTask.resume()
    }
    
    func saveToUserPersistentStore() {
        
        let moc = CoreDataStack.context
        do{
            try moc.save()
        } catch let error {
            print("Problem Saving to Persistent Store: \(error)")
        }
    }
    
    func loadProfiles() -> [Profile] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        do {
            let fetchedProfiles = try moc.fetch(fetchRequest)
            return fetchedProfiles
        } catch {
            fatalError("Failed to fetch Profiles: \(error)")
        }
    }
    
}
