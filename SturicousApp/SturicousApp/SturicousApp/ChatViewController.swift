//
//  ChatViewController.swift
//  SturicousApp
//
//  Created by yug brahmbhatt on 4/18/22.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var messages: [PFObject] = []
    let chatMessage = PFObject(className: "Message")

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        
        // Reload messages every second (interval of 1 second)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.retrieveChatMessages), userInfo: nil, repeats: true)
        tableView.reloadData()
    }
    

    @objc func retrieveChatMessages() {
        let query = PFQuery(className: "StutricousStudents")
        query.addDescendingOrder("createdAt")
        query.limit = 20
        query.includeKey("user")
        query.findObjectsInBackground { (messages, error) in
            if let messages = messages {
                self.messages = messages
                self.tableView.reloadData()
            }
            else {
                print(error!.localizedDescription)
            }
        }
    }
    
    
    @IBAction func onSend(_ sender: Any) {
        if messageTextField.text!.isEmpty == false {
            let chatMessage = PFObject(className: "StutricousStudents")
            chatMessage["text"] = messageTextField.text ?? ""
            chatMessage["user"] = PFUser.current()
            self.messageTextField.text = ""
            chatMessage.saveInBackground { (success, error) in
                if success {
                    print("The message was saved!")
                } else if let error = error {
                    print("Problem saving message: \(error.localizedDescription)")
                }
            }
        } else {
            print("\nMessage cannot be empty\n")
        }
    }
    
}
/*------ TableView Extension Functions ------*/

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        let message = messages[indexPath.row]
        cell.messageLabel.text = message["text"] as? String
        
        if let user = message["user"] as? PFUser {
            cell.usernameLabel.text = user.username
        } else {
            cell.usernameLabel.text = "?"
        }

        return cell
    }
    
    
}
