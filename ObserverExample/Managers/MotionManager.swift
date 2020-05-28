//
//  MotionManager.swift
//  ObserverExample
//
//  Created by Soha Ahmed on 27/05/2020.
//

import Foundation
import CoreMotion

class MotionManger: Provider{
    func stopDataProvider() {
        
    }
    
    func startDataProvider() {
        
    }
    
    
       var motionManager: CMMotionManager
    
     init(motionManager: CMMotionManager) {
         self.motionManager = motionManager
     }
}
