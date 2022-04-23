//
//  MealDetailViewController.swift
//  SturicousApp
//
//  Created by Rj O'Neal on 4/14/22.
//

import UIKit
import AlamofireImage
import Alamofire

class MealDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealDescription: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var IngredientLabel: UILabel!
    private var currMealData = [String:Any]()
    private var mealId:CLong?
    private var ingredientsList = [[String:Any]]()
    private var numberOfIngredients = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 800
        self.setUpUIElements()
        self.gatherAPIData()
        
    }
    func structureMeal(_ aMeal:[String:Any])
    {
        self.currMealData = aMeal
      
        
    }
    private func setUpUIElements()
    {
        let title = self.currMealData["title"] as! String
        let summary = self.currMealData["summary"] as! String
        let posterPath = self.currMealData["image"] as! String
        if(posterPath != "")
        {
            let posterUrl = URL(string: posterPath)
            self.mealImageView.af.setImage(withURL: posterUrl!)

        }
        self.mealName.text = title
        self.mealDescription.text = summary.htmlToString ?? ""
        self.mealId = self.currMealData["id"] as? CLong ?? 0
        
    }
    private func gatherAPIData()
    {
        if let currMealId  = self.mealId{
            let myParams = ["apiKey":"a9872aeef9824f6b95cea9d2b4a00e47"] as [String : Any]
            let myEndPoint = "/recipes/\(currMealId)/ingredientWidget.json"
            SpoonacularAPICaller.getData(myParams, myEndPoint)
            {
                (data:[String: Any]) in
                let ingredients = data["ingredients"] as! [[String:Any]]
                self.ingredientsList.append(contentsOf: ingredients)
                self.numberOfIngredients += self.ingredientsList.count
                self.tableView.reloadData()
            }
            SpoonacularAPICaller.getData(myParams, myEndPoint)
            {
                (data:[String: Any]) in
                let ingredients = data["ingredients"] as! [[String:Any]]
                self.ingredientsList.append(contentsOf: ingredients)
                self.numberOfIngredients += self.ingredientsList.count
                self.tableView.reloadData()
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredientsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") as! IngredientTableViewCell
        let ingredient = self.ingredientsList[indexPath.row]
        let name = ingredient["name"] as? String ?? ""
        let imageJPG = ingredient["image"] as? String ?? ""
        var metricInformation = ingredient["amount"] as? [String:Any]
        var amount = 0.0
        var unit = ""
        if let metricInfo = metricInformation
        {
            let unitedStates = metricInfo["us"] as? [String:Any]
            if let usMetric = unitedStates
            {
                amount = usMetric["value"] as? Double ?? 0.0
                unit = usMetric["unit"] as? String ?? ""
            }
        }
        let ingredientPath = "https://spoonacular.com/cdn/ingredients_100x100/\(imageJPG)"
        if(ingredientPath != "")
        {
            let ingredientUrl = URL(string: ingredientPath)
            cell.ingredientImageView.af.setImage(withURL: ingredientUrl!)
        }
        cell.ingredientNameLabel.text = name
        cell.amountLabel.text = String(amount)
        cell.metricLabel.text = unit
        return cell
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
