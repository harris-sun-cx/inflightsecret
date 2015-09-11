//
//  PendingWaterViewController.swift
//  ConnectedColors
//
//  Created by Calvin Tsang on 11/9/15.
//  Copyright © 2015 Ralf Ebert. All rights reserved.
//

import UIKit

class PendingWaterViewController: UIViewController {

    @IBOutlet weak var btnCancel: UIButton!
    
    weak var colorService: ColorServiceManager?
    var intent:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSLog("%@", "pending water view controller");
        navigationController?.navigationBarHidden = true;
        
        colorService?.sendRequest(self.intent!)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelButtonDidClicked(){
        print("cancel button clicked")
        navigationController?.popViewControllerAnimated(true);
        navigationController?.navigationBarHidden = false;
    }
    
    @IBAction func ratingButtonDidClicked(){
        let ratingViewController = RatingViewController(nibName: "RatingViewController", bundle: nil)
        ratingViewController.colorService = colorService;
        navigationController?.pushViewController(ratingViewController, animated: true);
    }


}
