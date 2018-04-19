//
//  PlaneMovement.swift
//  FlyingGameTry2
//
//  Created by Martynas L on 19/04/2018.
//  Copyright © 2018 ml15aad. All rights reserved.
//

import UIKit

class PlaneMovement: UIImageView{
    
    var planeDeleg: planeDelegate?
    var startLocation: CGPoint?
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        
        let dx = currentLocation!.x - startLocation!.x
        
        let dy = currentLocation!.y - startLocation!.y
        
        self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
        self.planeDeleg?.changePlaneMovement()
    }
    
}
