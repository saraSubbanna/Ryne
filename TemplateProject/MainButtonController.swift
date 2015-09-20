//
//  MainButtonController.swift
//  Bored - Nothing to Do
//
//  Created by Sara Subbanna on 7/7/15.
//  Copyright (c) 2015 Sara Subbanna. All rights reserved.
//

import UIKit
import Parse

class MainButtonController: UIButton {
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func drawRect(rect: CGRect) {
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        layer.masksToBounds = true
        layer.cornerRadius = 12.0
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(5, 5)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
        //superview is your optional embedding UIView
        if let superview = superview {
            //            superview.backgroundColor = UIColor.whiteColor()
            //            superview.layer.shadowColor = UIColor.darkGrayColor().CGColor
            //            superview.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 12.0).CGPath
            //            superview.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            //            superview.layer.shadowOpacity = 1.0
            //            superview.layer.shadowRadius = 3
            superview.layer.masksToBounds = true
            superview.clipsToBounds = false
        }
    }
    
}