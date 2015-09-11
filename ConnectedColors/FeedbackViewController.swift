//
//  FeedbackViewController.swift
//  ConnectedColors
//
//  Created by Calvin Tsang on 11/9/15.
//  Copyright © 2015 Ralf Ebert. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    weak var colorService: ColorServiceManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBarHidden = true;
        
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonDidClicked(){
        print("back button clicked")
        navigationController?.popViewControllerAnimated(true);
        navigationController?.navigationBarHidden = true;
    }
    
    @IBAction func linkedinButtonDidClicked(){
        
        let linkedinViewController = LinkedinViewController(nibName: "LinkedinViewController", bundle: nil)
        
        navigationController?.pushViewController(linkedinViewController, animated: true);
    }
}
