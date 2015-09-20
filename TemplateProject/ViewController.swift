
//
//  ViewController.swift
//  Bored - Nothing to Do
//
//  Created by Sara Subbanna on 7/7/15.
//  Copyright (c) 2015 Sara Subbanna. All rights reserved.
//

import UIKit
import Parse

class NothingViewController: UIViewController {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mainButton: MainButtonController!
    @IBOutlet weak var flagsLabel: UILabel!
    @IBOutlet weak var nextActivity: UITextView!
    var newActivityName: String?
    var counter = 0
    var thingsToDo: [PFObject]!
    var dontShowUsers =  ["a", "b"]
    var randomObject: PFObject!
    var working: Bool = false
    var loaded = false
    
    override func viewDidLoad() {
        nextActivity.text = ""
        super.viewDidLoad()
        let query = PFQuery(className: "Activity")
        query.whereKey("description", notContainedIn:dontShowUsers)
        // 6
        query.orderByDescending("createdAt")
        
        // 7
        query.findObjectsInBackgroundWithBlock {(result: [AnyObject]?, error: NSError?) -> Void in
            // 8
            self.thingsToDo = result as? [PFObject]
            println(self.thingsToDo.count)
            var loaded = true
        }
        
    }
    @IBAction func reportButtonTapped(sender: AnyObject) {
    
    let myAlertControler = UIAlertController(title: "Flag", message: "Would you like to report this acitivty as inappropriate?", preferredStyle: .Alert)
        
    let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .Cancel) { action -> Void in
        //Do the stuff if they are like wait I want a password
    }
        
    myAlertControler.addAction(cancelAction)
        
    let yesAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Default) { action -> Void in
        if self.randomObject != nil {
            var currentFlags = self.randomObject["Flags"] as! Int + 1
            //println(currentFlags)
            self.randomObject["Flags"] = currentFlags
            //if randomObject[Flags]
            if (currentFlags >= 3){
                self.randomObject.delete()
            }
            self.randomObject.save()
            var flagNum = String(self.randomObject["Flags"] as! Int)
            //println(flagNum)
            //println("")
            self.flagsLabel.text = flagNum
            
        }
        self.newActivity()
        
    }
        
     myAlertControler.addAction(yesAction)
        
    //myAlertControler.addTextFieldWithConfigurationHandler { textField -> Void in
    println("generating the TextField")
    //textField.placeholder = "Enter a password"
    //self.tField = textField
        if working == true {
        self.presentViewController(myAlertControler, animated: true, completion: nil)
        }
        else {
            newActivity()
        }
    }
    

    


//    @IBAction func flagButtonTapped(sender: AnyObject) {
//        if randomObject != nil {
//            var currentFlags = randomObject["Flags"] as! Int + 1
//            randomObject["Flags"] = currentFlags
//            //if randomObject[Flags]
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moreButtonTapped(sender: AnyObject) {
        newActivity()
    }
    
    func newActivity() {
        //if loaded == true {
            //activityIndicator.stopAnimating()
            working = true
            println(self.thingsToDo.count)
            var randomNum = Int(arc4random_uniform(UInt32(self.thingsToDo.count)))
            randomObject = self.thingsToDo[randomNum]
            var testString = randomObject.description
        println(testString)
            //println(testString)
            var notherTest = testString.rangeOfString("n = ")!.startIndex
        println(notherTest)
            var trying: String = String(stringInterpolationSegment: notherTest)
        println(trying)
            //println(trying)
            var startNum: Int = trying.toInt()!
            startNum += 5
            var newString = testString.substringWithRange(Range<String.Index>(start: advance(testString.startIndex, startNum), end: advance(testString.endIndex, -4)))
        println(newString)
            nextActivity.text = newString
            var flagNum: String!
            if (randomObject["Flags"] != nil){
                var flagNum = String(randomObject["Flags"] as! Int)
                flagsLabel.text = flagNum
            }
        
        
       // }
        //else {
        //    activityIndicator.startAnimating()
       // }
    }
    
    
}

