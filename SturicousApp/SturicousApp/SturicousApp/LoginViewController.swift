//
//  LoginViewController.swift
//  SturicousApp
//
//  Created by yug brahmbhatt on 4/7/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // testParseConnection()
    }
    
/* func testParseConnection(){
        let myObj = PFObject(className:"FirstClass")
        myObj["message"] = "Hey ! First message from Swift. Parse is now connected"
        myObj.saveInBackground { (success, error) in
            if(success){
                print("You are connected!")
            }else{
                print("An error has occurred!")
            }
        }
    }
 */
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    @IBAction func onSignIn(_ sender: Any)
    {
        
    }
    
    
    @IBAction func onSignUp(_ sender: Any)
    {
        let newuser = PFUser()
        let user = PFUser()
        user.username = self.usernameField.text
        user.password = self.passwordField.text
        user.signUpInBackground()
        {
            (success, error) in
            if success
            {
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            }
            else
            {
                print("Error: \(error)")
            }
        }
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
