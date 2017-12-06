//
//  ComposeViewController.swift
//  messagingapp4
//
//  Created by Yufang Lin on 23/10/2017.
//  Copyright © 2017 Yufang Lin. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Declare reference object
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPost(_ sender: Any) {
        
        // Take the user's text and save it to the database under Posts4 tree with a random id
        ref.child("Posts4").childByAutoId().setValue(textView.text)
        
        // Dismiss the ComposeViewController popover
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func cancelPost(_ sender: Any) {
        // Dismiss the ComposeViewController's popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
