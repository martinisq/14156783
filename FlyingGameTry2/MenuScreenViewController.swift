//
//  MainScreenViewController.swift
//  FlyingGameTry2
//
//  Created by Martynas L on 19/04/2018.
//  Copyright © 2018 ml15aad. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
  
    @IBAction func StartGame(_ sender: UIButton) {
        present( UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainstory") as UIViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

