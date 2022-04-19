//
//  ProfileViewController.swift
//  SturicousApp
//
//  Created by yug brahmbhatt on 4/18/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var favButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        profilePic.layer.borderWidth = 2
        profilePic.layer.borderColor = UIColor.white.cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
