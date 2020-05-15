import Foundation
import CoreMotion
import CoreLocation

class Manager {
    
    let motionManager = CMMotionManager()
    let altimeter = CMAltimeter()
    let locationManager = CLLocationManager()
    let mediator: Mediator
    
    let accelerometerDataProvider: AccelerometerDataProvider?
    let barometricDataProvider: BarometricDataProvider?
    let gpsDataProvider: GPSDataProvider?
    
    init() {
        self.mediator = Mediator()
        self.accelerometerDataProvider = AccelerometerDataProvider(dataMediator: self.mediator, motionManager: self.motionManager)
        self.barometricDataProvider = BarometricDataProvider(dataMediator: self.mediator, altimiter: self.altimeter)
        self.gpsDataProvider = GPSDataProvider(dataMediator: self.mediator, motionManager: self.locationManager)
    }
    
    func startSystem() {
        self.motionManager.accelerometerUpdateInterval = 0.1
        self.accelerometerDataProvider?.startDataProvider()
        self.barometricDataProvider?.startDataProvider()
        self.gpsDataProvider?.startDataProvider()
    }
    
    func requestAccelerometerDataSubscription(subscribeRequester: AccelerometerDataConsumerDelegate) {
        self.mediator.accelerometerDataConsumers.append(subscribeRequester)
    }
    
    func requestBarometerDataSubscription(subscribeRequester: BarometerDataConsumerDelegate) {
        self.mediator.barometerDataConsumers.append(subscribeRequester)
    }
    
    func requestGPSDataSubscription(subscribeRequester: GPSDataConsumerDelegate) {
        self.mediator.gpsDataConsumers.append(subscribeRequester)
    }
}
