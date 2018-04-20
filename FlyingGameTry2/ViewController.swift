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

    var mainScore = Int()

class ViewController: UIViewController, planeDelegate, UICollisionBehaviorDelegate {
    
    func changePlaneMovement() {
    }
    

    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    
    
    @IBOutlet weak var timerLB: UILabel!
    @IBOutlet weak var score: UILabel!

    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var objectGravity:UIGravityBehavior!
    var objectCollision:UICollisionBehavior!
    
    
    @IBOutlet weak var background1: UIImageView!
    @IBOutlet weak var background2: UIImageView!
    @IBOutlet weak var planeImage: PlaneMovement!
    var enemyPlane1 = UIImageView(image:nil)
    var enemyPlane2 = UIImageView(image:nil)
    var enemyPlane3 = UIImageView(image:nil)
    
    
    var timer = Timer()
    var number = Int(20)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TimerLabel.layer.borderWidth = 1.0
        TimerLabel.layer.cornerRadius = 8
        
        ScoreLabel.layer.borderWidth = 1.0
        TimerLabel.layer.cornerRadius = 8
        
        
        //backgroundLoop()
        enemyPlanes()
        enemyTimer()
        hitboxSpawn()
        hitboxTimer()
        
        gameTimer()
        gameLength()
        
        scoreTimer()
        
        planeImage.planeDeleg = self
    }
    
    func enemyTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector:#selector(ViewController.enemyPlanes), userInfo: nil, repeats: true)
    }
    
    
    
    
    
    
    //FUNCTION
    //Declares: Enemy planes and their behaviour in game
    
    func enemyPlanes(){
        
        enemyPlane1.image=UIImage(named: "eplane1")
        enemyPlane1.frame=CGRect(x:Int(arc4random_uniform(301)),y:-500,width:80,height:95)
        self.view.addSubview(enemyPlane1)
        
        enemyPlane2.image=UIImage(named:"eplane2")
        enemyPlane2.frame=CGRect(x:Int(arc4random_uniform(301)),y:-400,width:80,height:95)
        self.view.addSubview(enemyPlane2)
        
        enemyPlane3.image=UIImage(named: "eplane3")
        enemyPlane3.frame=CGRect(x:Int(arc4random_uniform(301)),y:-100,width:80,height:95)
        self.view.addSubview(enemyPlane3)
        
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        objectGravity = UIGravityBehavior(items:[enemyPlane1,enemyPlane2,enemyPlane3])
        objectGravity.magnitude = 0.4
        dynamicAnimator.addBehavior(objectGravity)
        objectCollision = UICollisionBehavior(items:[enemyPlane1, enemyPlane2, enemyPlane3])
        dynamicAnimator.addBehavior(objectCollision)
        objectCollision.collisionDelegate = self
        
        dynamicItemBehavior = UIDynamicItemBehavior(items: [enemyPlane1, enemyPlane2, enemyPlane3])
        dynamicItemBehavior.elasticity = 0.3
        dynamicAnimator.addBehavior(dynamicItemBehavior)
     }
    
    
    
    
    
    
    //FUNCTION
    //Description: Timer of the hitbox
    
    func hitboxTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.hitboxSpawn), userInfo: nil, repeats: true)
    }
    
    
    
    
    //FUNCTION
    //Description: Spawns main plane's hitbox
    
    
    func hitboxSpawn(){
        objectCollision.removeAllBoundaries()
        let pHitbox = UIView(frame:CGRect(x:planeImage.center.x-25, y:planeImage.center.y-50, width:50, height: 80))
        //view.addSubview(pHitbox)
        //self.view.bringSubview(toFront: planeImage)
        
        objectCollision.addBoundary(withIdentifier: "pHitbox" as NSCopying, for: UIBezierPath(rect:pHitbox.frame))
        dynamicAnimator.addBehavior(objectCollision)
        objectCollision.collisionDelegate = self
        
        if(pHitbox.frame.intersects(enemyPlane1.frame)) || (pHitbox.frame.intersects(enemyPlane2.frame)) || (pHitbox.frame.intersects(enemyPlane3.frame)){
            mainScore = mainScore - 10
            score.text = String(mainScore)
        }
        
    }

    func scoreTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.gameScore), userInfo: nil, repeats: true)
    }
    
    func gameScore(){
        let enemyPlaneY = enemyPlane1.convert(enemyPlane1.center, to:self.view)
        let enemyPlane2Y = enemyPlane2.convert(enemyPlane2.center, to:self.view)
        let enemyPlane3Y = enemyPlane3.convert(enemyPlane3.center, to: self.view)
        
        let object = planeImage.convert(enemyPlane1.center, to:self.view)
        if enemyPlaneY.y >= object.y{
            mainScore = mainScore + 20
            score.text = String(mainScore)
        }
        
        if enemyPlane2Y.y >= object.y{
            mainScore = mainScore + 20
            score.text = String(mainScore)
        }
        
        if enemyPlane3Y.y >= object.y{
            mainScore = mainScore + 20
            score.text = String(mainScore)
        }
    }
  
    
    
    func gameTimer(){
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(ViewController.gameLength),userInfo:nil, repeats: true )    }
    
    func gameLength(){
        number = number - 1
        timerLB.text = String(number)
        
        if number == 0{
            
            present( UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "AfterGameScreen") as UIViewController, animated: true, completion: nil)
        }
    }
    
    
    
    
    //func backgroundLoop(){
        //UIView.animate(withDuration: 5, delay:0.0, options:[UIViewAnimationOptions.repeat, .curveLinear], animations: {
            
            //self.background1.center.y += self.view.bounds.height
            //self.background2.center.y += self.view.bounds.height
            
        //})
        
    
    
    override func viewDidAppear(_ animated: Bool) {
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

