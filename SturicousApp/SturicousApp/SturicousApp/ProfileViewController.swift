//
//  ProfileViewController.swift
//  SturicousApp
//
//  Created by yug brahmbhatt on 4/18/22.
//

import UIKit
import AlamofireImage
import Parse
import AVKit
import MobileCoreServices

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var EditPreferencesbtn: UIButton!
    @IBOutlet weak var insertPreferences: UILabel!
    
    var posts = [PFObject]()
    public var myPreferences:Set<String> = []
    
    

    override func viewDidLoad() {
        SetPreftext()
        Setdisplaytext()
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        profilePic.layer.borderWidth = 2
        profilePic.layer.borderColor = UIColor.white.cgColor
        super.viewDidLoad()
        let query = PFQuery(className: "Posts")
        query.includeKeys(["author"])
        query.findObjectsInBackground()
    }
    
    func Setdisplaytext()
    {
        self.displayNameLabel.text = PFUser.current()?.username
    }
    
    
    func SetPreftext()
    {
        let myPref = PFUser.current()?["preferences"]
        let myPrefString = String(describing: myPref)
        let myPrefArr = myPrefString.components(separatedBy: " ")
        let myPrefValue = myPrefArr[1]
        if myPrefValue.count > 21 {
            print(myPrefValue.count)
            let start = myPrefValue.index(myPrefValue.startIndex, offsetBy: 16)
            let end = myPrefValue.index(myPrefValue.endIndex, offsetBy: -3)
            let range = start..<end
            let mySubPref = myPrefValue[range]
            print((String(mySubPref).count))
            if (String(mySubPref).count) > 2 {
                self.insertPreferences.text = (String(mySubPref))
            } else {
                insertPreferences.text = "None"
            }
        } else {
            insertPreferences.text = "None"
        }
    }
         
    @IBAction func OnSelectPhoto(_ sender: Any)
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        profilePic.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)

        let post = PFObject(className: "ProfilePic")
        post["author"] = PFUser.current()!
        
        let imageData = profilePic.image!.pngData()
        print(imageData!)
        
        let file = PFFileObject(name: "image.png", data: imageData!)
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
                let query = PFQuery(className: "ProfilePic")
                query.includeKeys(["author"])
                
                query.findObjectsInBackground { (posts, error) in
                    if posts != nil {
                        self.posts = posts!
            } else {
                print("error!")
            }
        }
    }
        }
    }
    
    @IBAction func OnEdit(_ sender: Any)
    {
        self.performSegue(withIdentifier: "ShowPreferences", sender: nil)
        print("User editing preferences...")
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
