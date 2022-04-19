//
//  ProfileTableViewCell.swift
//  SturicousApp
//
//  Created by yug brahmbhatt on 4/18/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dietaryPreferenceLabel: UILabel!
    @IBOutlet weak var editRestrictionsbtn: UIButton!
    @IBOutlet weak var dietGoalLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
