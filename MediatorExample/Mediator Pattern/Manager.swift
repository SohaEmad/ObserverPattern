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
        self.accelerometerDataProvider = AccelerometerDataProvider(mediator: self.mediator, motionManager: self.motionManager)
        self.barometricDataProvider = BarometricDataProvider(mediator: self.mediator, altimiter: self.altimeter)
        self.gpsDataProvider = GPSDataProvider(mediator: self.mediator, motionManager: self.locationManager)
    }
    
    func startSystem() {
        self.motionManager.accelerometerUpdateInterval = 0.1
        self.accelerometerDataProvider?.startDataProvider()
        self.barometricDataProvider?.startDataProvider()
        self.gpsDataProvider?.startDataProvider()
    }
}
