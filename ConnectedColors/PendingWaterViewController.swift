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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSLog("%@", "pending water view controller");
        navigationController?.navigationBarHidden = true;
        
        let intent : String = "water";
        colorService?.sendRequest(intent);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonDidClicked(){
        navigationController?.popViewControllerAnimated(true);
        navigationController?.navigationBarHidden = false;
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
