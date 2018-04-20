//
//  StartScreenController.swift
//  FlyingGameTry2
//
//  Created by Martynas L on 20/04/2018.
//  Copyright © 2018 ml15aad. All rights reserved.
//

import UIKit

class StartScreenController: UIViewController {
    @IBAction func startButton(_ sender: UIButton) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewcontroller : ViewController = mainSB.instantiateViewController(withIdentifier: "MainStoryboard") as! ViewController
        mainScore = 0
        self.present(viewcontroller, animated: true, completion: nil)
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
