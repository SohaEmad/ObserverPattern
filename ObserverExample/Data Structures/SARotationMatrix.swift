//
//  SARotationMatrix.swift
//  ObserverExample
//
//  Created by Soha Ahmed on 27/05/2020.
//

import Foundation

struct SARotation: CustomStringConvertible {
    
    var rotationValue: Double
    
    var description: String {
        
        let description: String = "Rotation value is : " + String(format:"%f", self.rotationValue)
        
        return description
    }
    
    init( rotationValue: Double){
        
        self.rotationValue = rotationValue
    }



    
}
