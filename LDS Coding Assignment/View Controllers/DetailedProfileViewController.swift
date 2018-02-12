//
//  DetailedProfileViewController.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/2/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//

import UIKit

class DetailedProfileViewController: UIViewController {
    
    // MARK: - Properties
    var profile: Profile?
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var affilliationLabel: UILabel!
    @IBOutlet weak var forceBoolLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI() {
        if let profile = profile {
            profilePicture.image = profile.image
            nameLabel.text = "\(profile.firstName) \(profile.lastName)"
            idLabel.text = "\(profile.id)"
            birthDateLabel.text = profile.birthdate
            affilliationLabel.text = profile.affiliation
            if profile.forceSensitive == true {
                forceBoolLabel.text = "Yes"
            } else {
                forceBoolLabel.text = "No"
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
