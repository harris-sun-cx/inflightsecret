//
//  RatingViewController.swift
//  ConnectedColors
//
//  Created by Calvin Tsang on 11/9/15.
//  Copyright © 2015 Ralf Ebert. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    weak var colorService: ColorServiceManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonDidClicked(sender : AnyObject){
        navigationController?.popViewControllerAnimated(true);
        navigationController?.navigationBarHidden = false;
    }
    @IBAction func disgustButtonDidClicked(sender : AnyObject){
        let emotion : String = "disgust";
        colorService?.sendRequest(emotion)
        
    }
    @IBAction func joyButtonDidClicked(sender : AnyObject){
        let emotion : String = "joy";
        colorService?.sendRequest(emotion)
        
    }

}
