//
//  DietPreferencesViewController.swift
//  SturicousApp
//
//  Created by Rj O'Neal on 4/11/22.
//

import UIKit

class DietPreferencesViewController: UIViewController {

    @IBOutlet weak var ketogenicBtn: UIButton!
    
    @IBOutlet weak var atkinsBtn: UIButton!
    
    @IBOutlet weak var veganBtn: UIButton!
    
    @IBOutlet weak var vegeterianBtn: UIButton!
    
    private var recipeDictionaries:[[String:Any]]!
    
    private var myPreferences:[String]!
    override func viewDidLoad() {
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
    @IBAction func onSubmit(_ sender: Any)
    {
       
    }
    
}
