import CoreMotion
import Foundation

class AccelerometerDataProvider{
    
    weak var dataMediator: ProviderToMediatorDataDelegate?
    let motionManager: CMMotionManager
    
    init(dataMediator: ProviderToMediatorDataDelegate, motionManager: CMMotionManager) {
        self.dataMediator = dataMediator
        self.motionManager = motionManager
    }
    
    func startDataProvider() {
        self.motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
            guard let data = data else { return }
            // Error handling has been omitted but should be included in this class
            
            // Conversion of the data to an agreed format can happen here
            // At the moment we are just converting putting the data into a custom type
            let processedData = NZAcceleration(x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
            print(processedData.description)
            
            self.dataMediator?.acceleromterDataReceiver(accelerationData: processedData)
        }
    }
}
