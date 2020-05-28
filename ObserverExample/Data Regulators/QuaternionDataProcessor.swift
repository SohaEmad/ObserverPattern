//
//  QuaternionDataProcessor.swift
//  ObserverExample
//
//  Created by Soha Ahmed on 27/05/2020.
//

import Foundation
class QuaternionDataProvider : MotionManger{

var QuaternionDataConsumers: [QuaternionDataConsumerDelegate] = []

override func startDataProvider() {
    motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
     guard let data = data, error == nil else { return }
        let rotationQuaternion = data.attitude.quaternion
        let processedData = SAQuaternion(x: rotationQuaternion.x,
                                         y: rotationQuaternion.y,
                                         z: rotationQuaternion.z,
                                         w: rotationQuaternion.w)
    
        print(processedData.description)

        for consumer in self.QuaternionDataConsumers {
                   consumer.receiveQuaternionData(quaternionData: processedData)
               }
}
    }
    override func stopDataProvider() {
    
}
}
