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
    }

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
    
    
    @IBAction func onSignIn(_ sender: Any) {
        // Login user
    
        // Check text field inputs
        if usernameAndPasswordNotEmpty() {
            let username = usernameField.text ?? ""
            let password = passwordField.text ?? ""
            
            PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
                if let error = error {
                    print("User log in failed: \(error.localizedDescription)")
                    self.displayLoginError(error: error)
                } else {
                    print("User \(username) logged in successfully")
                    // display view controller that needs to shown after successful login
                    NotificationCenter.default.post(name: NSNotification.Name("login"), object: nil)

                    
                }
            }
        }
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        // Sign up user
        // Check text field inputs
        if usernameAndPasswordNotEmpty() {
            // initialize a user object
            let newUser = PFUser()
            
            // set user properties
            newUser.username = usernameField.text
            newUser.password = passwordField.text
            
            // call sign up function on the object
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                    self.displaySignupError(error: error)
                } else {
                    print("User \(newUser.username!) Registered successfully")
                    NotificationCenter.default.post(name: NSNotification.Name("login"), object: nil)
                    
                }
            }
        }
        
    }
    
    
    /*------ Handle text field inputs  ------*/
    
    func usernameAndPasswordNotEmpty() -> Bool {
        // Check text field inputs
        if usernameField.text!.isEmpty || passwordField.text!.isEmpty {
            displayError()
            return false
        } else {
            return true
        }
    }
    
    /*------ Alert Controllers ------*/
    // Text fields are empty alert controller
    func displayError() {
        let title = "Error"
        let message = "Username and password field cannot be empty"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
    
    // Login error alert controller
    func displayLoginError(error: Error) {
        let title = "Login Error"
        let message = "Oops! Something went wrong while logging in: \(error.localizedDescription)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
    
    
    // Sign up error alert controller
    func displaySignupError(error: Error) {
        let title = "Sign up error"
        let message = "Oops! Something went wrong while signing up: \(error.localizedDescription)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        present(alertController, animated: true)
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
