//
//  SAQuaternion.swift
//  ObserverExample
//
//  Created by Soha Ahmed on 27/05/2020.
//

import Foundation
struct SAQuaternion: CustomStringConvertible {
    var x: Double, y: Double, z: Double, w: Double
    
    var description: String {
        let rotationQuaternionAsArray = [self.w,
                                         self.x,
                                         self.y,
                                         self.z]
        let description: String = "Quaternion -> w: " + self.w.description +  ", x:" + self.x.description + ", y:" + self.y.description+", z:" + self.z.description
        
          return description
      }
    
    init(x: Double, y: Double, z: Double, w: Double){
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }

}
