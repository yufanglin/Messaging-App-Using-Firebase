//
//  ViewController.swift
//  messagingapp4
//
//  Created by Yufang Lin on 23/10/2017.
//  Copyright © 2017 Yufang Lin. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    var postData = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set ViewController's tableView's delegate/dataSource to ViewController
        tableView.delegate = self
        tableView.dataSource = self
        
        // Declare reference object
        ref = Database.database().reference()
        
        // Declare handle to listen to event changes on Posts4 child
        handle = ref?.child("Posts4").observe(.childAdded, with: { (snapshot) in
            // Get the value from snapshot and save it as a string
            let value = snapshot.value as? String
            
            // Optional Binding: in case value not found 
            if let actualValue = value {
                // save the value to the local data (which is ViewController's global array)
                self.postData.append(actualValue)
                
                // update the table with the new post
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of tableview entries, in this case, the number of posts
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell to reuse with identity of PostCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")!
        
        // Set cell's labele's text with the saved posts
        cell.textLabel?.text = postData[indexPath.row]
        
        // return the rused cell 
        return cell
    }

}

