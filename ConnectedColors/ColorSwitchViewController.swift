//
//  ViewController.swift
//  ConnectedColors
//
//  Created by Ralf Ebert on 28/04/15.
//  Copyright (c) 2015 Ralf Ebert. All rights reserved.
//

import UIKit

class ColorSwitchViewController: UIViewController {

    @IBOutlet weak var connectionsLabel: UILabel!
    
    let colorService = ColorServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func redTapped(sender: AnyObject) {
    }
    
    @IBAction func yellowTapped(sender: AnyObject) {
    }
    
}

