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
    @IBOutlet weak var imageview: UIImageView!
    
    let colorService = ColorServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self
    }

    @IBAction func redTapped(sender: AnyObject) {
        self.changeColor(UIColor.redColor())
        colorService.sendColor("red")
    }
    
    @IBAction func yellowTapped(sender: AnyObject) {
        self.changeColor(UIColor.yellowColor())
        colorService.sendColor("yellow")
    }
    
    func changeColor(color : UIColor) {
        UIView.animateWithDuration(0.2) {
            self.view.backgroundColor = color
        }
    }
    
    @IBAction func waterTapper(sender: AnyObject){
        
        let pendingWaterViewController = PendingWaterViewController(nibName: "PendingWaterViewController", bundle: nil)
        pendingWaterViewController.colorService = colorService;
        navigationController?.pushViewController(pendingWaterViewController, animated: true);
        
    }
    
    @IBAction func snackTapped(sender: AnyObject){
        let pendingWaterViewController = PendingWaterViewController(nibName: "PendingWaterViewController", bundle: nil)
        pendingWaterViewController.colorService = colorService;
        navigationController?.pushViewController(pendingWaterViewController, animated: true);

    }
    
    @IBAction func happyTapped(sender: AnyObject){
        let emotion : String = "joy";
        colorService.sendRequest(emotion)
    }

    @IBAction func disgustTapped(sender: AnyObject){
        let emotion : String = "disgust";
        colorService.sendRequest(emotion)
    }
    
    func showWater(title : String){
        print(title);
        
        let imageName = "ah_image.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        view.addSubview(imageView)

    }
    
    func showEmotion(emotion: String){
        NSLog("%@", "emotion= \(emotion)");
        var imageName : String!
        if (emotion == "joy"){
           imageName = "joy.jpg"
        }else if (emotion == "disgust"){
           imageName = "disgust.jpg"
        }
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 169, height: 300)
        view.addSubview(imageView)
        
    }

    
}

extension ColorSwitchViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }
    
    func colorChanged(manager: ColorServiceManager, colorString: String) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            switch colorString {
            case "red":
                self.changeColor(UIColor.redColor())
            case "yellow":
                self.changeColor(UIColor.yellowColor())
            default:
                NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }
    
    func requestChanged(manager: ColorServiceManager, intentString: String) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            switch intentString {
            case "water":
                self.showWater(intentString);

            case "joy":
                self.showEmotion(intentString);

            case "disgust":
                self.showEmotion(intentString);

            default:
                NSLog("%@", "Unknown intent value received: \(intentString)")
            }
        }
    }
    
}