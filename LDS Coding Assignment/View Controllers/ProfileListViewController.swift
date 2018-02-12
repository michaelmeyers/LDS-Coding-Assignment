//
//  ProfileListViewController.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/2/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//

import UIKit

class ProfileListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegateAndDatasource()
        if ProfileController.shared.profiles == nil {
            ProfileController.shared.fetchProfiles(completion: {
                guard let profiles = ProfileController.shared.profiles else {return}
                let group = DispatchGroup()
                for profile in profiles{
                    group.enter()
                    ProfileController.shared.fetchImage(profile: profile, completion: {
                        group.leave()
                    })
                }
                group.notify(queue: .main, execute: {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func assignDelegateAndDatasource() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileController.shared.profiles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.profileCellIdentifier, for: indexPath) as? ProfileTableViewCell,
            let profiles = ProfileController.shared.profiles else {return UITableViewCell()}
        
        let profile = profiles[indexPath.row]
        
        cell.updateCell(profile: profile)
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Keys.segueIdentifierToDetailVC,
            let detailedProfileVC = segue.destination as? DetailedProfileViewController,
            let indexPath = tableView.indexPathForSelectedRow,
            let profiles = ProfileController.shared.profiles else {return}
        
        let profile = profiles[indexPath.row]
        detailedProfileVC.profile = profile
    }
    
}
