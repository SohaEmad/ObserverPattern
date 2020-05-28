import Foundation
import CoreMotion


class AccelerometerDataProvider: MotionManger{
        
    var accelerometerDataConsumers: [AccelerometerDataConsumerDelegate] = []
    
    override func startDataProvider() {
        self.motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
            guard let data = data else { return }
            // Error handling has been omitted but should be included in this class
            
            // Conversion of the data to an agreed format can happen here
            // At the moment we are just converting putting the data into a custom type
            let processedData = NZAcceleration(x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
            
            // Print a logged description of the data and send to the consumers
            print(processedData.description)
            for consumer in self.accelerometerDataConsumers {
                consumer.receiveAccelerometerData(accelerationData: processedData)
            }
        }
    }
    override func stopDataProvider() {
    
    }
    
}
