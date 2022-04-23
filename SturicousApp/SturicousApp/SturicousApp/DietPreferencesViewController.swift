//
//  DietPreferencesViewController.swift
//  SturicousApp
//
//  Created by Rj O'Neal on 4/11/22.
//

import UIKit
import Parse

class DietPreferencesViewController: UIViewController {

    @IBOutlet weak var ketogenicBtn: UIButton!

    @IBOutlet weak var mediterraneanBtn: UIButton!

    @IBOutlet weak var veganBtn: UIButton!

    private var recipeDictionaries:[[String:Any]]!
    public var myPreferences:Set<String> = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func setStatesOfButtons()
    {
        self.ketogenicBtn.setTitleColor(UIColor.gray, for: .normal)
        self.mediterraneanBtn.setTitleColor(UIColor.gray, for: .normal)
        self.veganBtn.setTitleColor(UIColor.gray, for: .normal)
        self.ketogenicBtn.setTitleColor(UIColor.white, for: .selected)
        self.mediterraneanBtn.setTitleColor(UIColor.white, for: .selected)
        self.veganBtn.setTitleColor(UIColor.white, for: .selected)
    }

    @IBAction func onKeto(_ sender: UIButton)
    {
        if(sender.isSelected)
        {
            self.myPreferences.remove("ketogenic")
        }
        else
        {
            self.myPreferences.insert("ketogenic")
        }
        sender.isSelected = !sender.isSelected

    }
    @IBAction func onMediterranean(_ sender: UIButton)
    {
        if(sender.isSelected)
        {
            self.myPreferences.remove("mediterranean")
        }
        else
        {
            self.myPreferences.insert("mediterranean")
        }
        sender.isSelected = !sender.isSelected
    }

    @IBAction func onVegan(_ sender: UIButton)
    {
        if(sender.isSelected)
        {
            self.myPreferences.remove("vegan")
        }
        else
        {
            self.myPreferences.insert("vegan")
        }
        sender.isSelected = !sender.isSelected
    }

    @IBAction func onSubmit(_ sender: Any)
    {
        let current_user  = PFUser.current()!
        current_user["preferences"] = Array(self.myPreferences)
        current_user.saveInBackground
        {
          (success: Bool, error: Error?) in
          if (success) {
              print("User editted preferences!")
              self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
          } else {
            // There was a problem, check error.description
          }
        }
    }
}
