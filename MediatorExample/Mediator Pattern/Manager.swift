import Foundation
import CoreMotion

class Manager {
    
    let motionManager = CMMotionManager()
    let altimeter = CMAltimeter()
    let mediator: Mediator
    
    let accelerometerDataProvider: AccelerometerDataProvider?
    let barometricDataProvider: BarometricDataProvider?
    
    init() {
        self.mediator = Mediator()
        self.accelerometerDataProvider = AccelerometerDataProvider(mediator: self.mediator, motionManager: self.motionManager)
        self.barometricDataProvider = BarometricDataProvider(mediator: self.mediator, altimiter: self.altimeter)
    }
    
    func startSystem() {
        self.motionManager.accelerometerUpdateInterval = 0.1
        self.accelerometerDataProvider?.startDataProvider()
        self.barometricDataProvider?.startDataProvider()
    }
}
