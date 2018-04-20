//
//  MenuViewController.swift
//  FlyingGameTry2
//
//  Created by Martynas L on 19/04/2018.
//  Copyright © 2018 ml15aad. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var previousScore: UILabel!
    @IBAction func replayButton(_ sender: UIButton ) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewcontroller : ViewController = mainSB.instantiateViewController(withIdentifier: "MainStoryboard") as! ViewController
        mainScore = 0
        self.present(viewcontroller, animated: true, completion: nil)

    }
    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        previousScore.text=String(mainScore)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}
    
