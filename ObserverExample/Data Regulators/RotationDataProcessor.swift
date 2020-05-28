//
//  RotationDataProcessor.swift
//  ObserverExample
//
//  Created by Soha Ahmed on 27/05/2020.
//

import Foundation
import CoreMotion

class RotationDataProvider: MotionManger{

    var RotationDataConsumers: [RotationDataConsumerDelegate] = []

    override func startDataProvider() {
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
         guard let data = data, error == nil else { return }
            let processedData = SARotation(rotationValue: getAngleFromOriginalOrientation(rotationData: data.attitude.rotationMatrix))
        
            print(processedData.description)

            for consumer in self.RotationDataConsumers {
                       consumer.receiveRotationData(rotationData: processedData)
                   }
    }
    func stopDataProvider() {
        
    }

   func getAngleFromOriginalOrientation(rotationData: CMRotationMatrix) -> Double {
            let rotation = [atan2(rotationData.m12, rotationData.m22),
                             asin(-rotationData.m32),
                             atan2(-rotationData.m31, rotationData.m33)]
            let degrees = radiansToDegrees(radians: rotation[0])
            let correctedDegrees: Double = -1 * degrees // This value corrects the direction of the angle.
            return correctedDegrees
        }
         func radiansToDegrees(radians: Double) -> Double {
            return 180 * (radians / Double.pi)
        }
        
}
}
