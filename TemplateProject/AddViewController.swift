//
//  AddViewController.swift
//  Bored - Nothing to Do
//
//  Created by Srividhya Gopalan on 8/3/15.
//  Copyright (c) 2015 Srividhya Gopalan. All rights reserved.
//

import UIKit
import Parse

class AddViewController: UIViewController {
    @IBOutlet weak var newActivityDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createButtonTapped(sender: AnyObject) {
        var stringForActivity = newActivityDescription.text
        if stringForActivity != "New Bore'd: " {
            var newPost = PFObject (className:"Activity")
            newPost["Flags"] = 0
            newPost["description"] = stringForActivity
            newPost.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    //println("activity saved")
                } else {
                    //println("activity not saved")
                }
                
            }
        }
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
