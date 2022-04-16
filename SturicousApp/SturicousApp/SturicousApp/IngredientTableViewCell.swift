//
//  IngredientTableViewCell.swift
//  SturicousApp
//
//  Created by Rj O'Neal on 4/15/22.
//

import UIKit

class IngredientTableViewCell: UITableViewCell
{

    @IBOutlet weak var ingredientImageView: UIImageView!
    
    @IBOutlet weak var ingredientNameLabel: UILabel!
    
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var metricLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
