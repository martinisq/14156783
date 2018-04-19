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
    var objectGravity:UIGravityBehavior!
    var objectCollision:UICollisionBehavior!
    func changePlaneMovement() {
    }
    
    
    @IBOutlet weak var background1: UIImageView!
    @IBOutlet weak var background2: UIImageView!
    @IBOutlet weak var planeImage: PlaneMovement!
    var enemyPlane1 = UIImageView(image:nil)
    var enemyPlane2 = UIImageView(image:nil)
    var enemyPlane3 = UIImageView(image:nil)
    var timer = Timer()
    
    
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundLoop()
        enemyPlanes()
        enemyTimer()
    }
    
    func enemyTimer(){
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector:#selector(ViewController.enemyPlanes), userInfo: nil, repeats: true)
    }
    
    
    func enemyPlanes(){
        
        enemyPlane1.image=UIImage(named: "eplane1")
        enemyPlane1.frame=CGRect(x:Int(arc4random_uniform(301)),y:-500,width:80,height:95)
        self.view.addSubview(enemyPlane1)
        
        enemyPlane2.image=UIImage(named:"eplane2")
        enemyPlane2.frame=CGRect(x:Int(arc4random_uniform(301)),y:-900,width:80,height:95)
        self.view.addSubview(enemyPlane2)
        
        enemyPlane3.image=UIImage(named: "eplane3")
        enemyPlane3.frame=CGRect(x:Int(arc4random_uniform(301)),y:-100,width:80,height:95)
        self.view.addSubview(enemyPlane3)
        
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        objectGravity = UIGravityBehavior(items:[enemyPlane1,enemyPlane2,enemyPlane3])
        objectGravity.magnitude = 0.3
        dynamicAnimator.addBehavior(objectGravity)
     }
    
    func planeHitbox(){
        let hitbox =
        
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

