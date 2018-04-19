//
//  ViewController.swift
//  FlyingGameTry2
//
//  Created by ml15aad on 19/04/2018.
//  Copyright © 2018 ml15aad. All rights reserved.
//

import UIKit
protocol planeDelegate {
    func changePlaneMovement()
}

class ViewController: UIViewController, planeDelegate {
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    func changePlaneMovement() {
    }
    
    
    
    
    @IBOutlet weak var background1: UIImageView!
    @IBOutlet weak var background2: UIImageView!
    @IBOutlet weak var planeImage: PlaneMovement!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundLoop()
    }
    
    
   
    func backgroundLoop(){
        UIView.animate(withDuration: 5, delay:0.0, options:[UIViewAnimationOptions.repeat, .curveLinear], animations: {
            
            self.background1.center.y += self.view.bounds.height
            self.background2.center.y += self.view.bounds.height
            
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

