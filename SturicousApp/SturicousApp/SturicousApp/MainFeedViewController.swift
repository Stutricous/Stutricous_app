//
//  MainFeedViewController.swift
//  SturicousApp
//
//  Created by Rj O'Neal on 4/12/22.
//

import UIKit
import AlamofireImage
import Parse

class MainFeedTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    private var meals = [[String:Any]]()
    private var savedPreferences = [String]()
    private var numberOfMeals:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
        self.tableView.estimatedRowHeight = 300
        self.loadSavedPerferences()
        self.populateMeals()
    }
    override func viewWillAppear(_ animated: Bool) {
        return
    }
    func loadSavedPerferences()
    {
        let curr_user = PFUser.current()!
        let preferences = curr_user["preferences"] as? [String] ?? []
        self.savedPreferences.append(contentsOf: preferences)
        
    }
    func populateMeals()
    {
        var stringPerf = ""
        self.savedPreferences.forEach { (element:String) in
            if(element != self.savedPreferences.last)
            {
                stringPerf += "\(element),"
            }
            else
            {
                stringPerf += element
            }
        }
        let myParams = ["apiKey":"57021b3f90dd45afae68b1f9a0316c93", "number": 10,"tags": stringPerf] as [String : Any]
        let myEndPoint = "/recipes/random"
        SpoonacularAPICaller.getData(myParams, myEndPoint)
        {
            (data:[String: Any]) in
            let recipes = data["recipes"] as! [[String:Any]]
            self.meals.append(contentsOf: recipes)
            self.numberOfMeals += self.meals.count
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.numberOfMeals
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealTableViewCell
        let recipe = self.meals[indexPath.row]
        let title = recipe["title"] as! String
        let summary = recipe["summary"] as? String
        let posterPath = recipe["image"] as? String ?? ""
        // URL class makes sure
        if(posterPath != "")
        {
            let posterUrl = URL(string: posterPath)
            cell.mealImage.af.setImage(withURL: posterUrl!)
        }
        cell.mealNameLabel?.text = title ?? ""
        cell.descriptionLabel.text = summary?.htmlToString ?? ""
        return cell
    }
    
    // MARK: - Navigation
//In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "MealDetailSegue")
        {
            let cell = sender as! MealTableViewCell
            // get the indexPath
            let indexPath = tableView.indexPath(for: cell)!
            let recipe = self.meals[indexPath.row]
            let destination_controller = segue.destination as! MealDetailViewController
            destination_controller.structureMeal(recipe)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    @IBAction func logout(_ sender: Any)
    {
        PFUser.logOut()
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "userName")
        defaults.removeObject(forKey: "password")
        defaults.synchronize()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        // accessing the scene delegate
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        delegate.window?.rootViewController = loginViewController
    }
}

// we need to additional functionality to the string class inorder to unwrap optional
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
