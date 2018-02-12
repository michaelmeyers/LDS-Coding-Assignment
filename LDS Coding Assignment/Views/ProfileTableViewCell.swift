//
//  ProfileTableViewCell.swift
//  LDS Coding Assignment
//
//  Created by Michael Meyers on 2/12/18.
//  Copyright © 2018 Michael Meyers. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(profile: Profile) {
        profilePicture.image = profile.image
        nameLabel.text = profile.firstName+" "+profile.lastName
    }
}
