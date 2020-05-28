import Foundation
import CoreMotion
import CoreLocation

class Manager {
    
    let motionManager = CMMotionManager()
    let altimeter = CMAltimeter()
    let locationManager = CLLocationManager()
    
    let accelerometerDataProvider: AccelerometerDataProvider
    let barometricDataProvider: BarometricDataProvider
    let gpsDataProvider: GPSDataProvider
    let rotationDataProvider: RotationDataProvider
    let quaternionDataProvider: QuaternionDataProvider
    
    
    init() {
        self.accelerometerDataProvider = AccelerometerDataProvider(motionManager: self.motionManager)
        self.barometricDataProvider = BarometricDataProvider(altimiter: self.altimeter)
        self.gpsDataProvider = GPSDataProvider(motionManager: self.locationManager)
        self.rotationDataProvider = RotationDataProvider(motionManager: self.motionManager)
        self.quaternionDataProvider = QuaternionDataProvider(motionManager: self.motionManager)
    }
    
    func startSystem() {
        self.motionManager.accelerometerUpdateInterval = 0.1
        self.accelerometerDataProvider.startDataProvider()
        self.barometricDataProvider.startDataProvider()
        self.gpsDataProvider.startDataProvider()
        self.rotationDataProvider.startDataProvider()
        self.quaternionDataProvider.startDataProvider()

    }
    
    func requestAccelerometerDataSubscription(subscribeRequester: AccelerometerDataConsumerDelegate) {
        self.accelerometerDataProvider.accelerometerDataConsumers.append(subscribeRequester)
    }
    
    func requestBarometerDataSubscription(subscribeRequester: BarometerDataConsumerDelegate) {
        self.barometricDataProvider.barometerDataConsumers.append(subscribeRequester)
    }
    
    func requestGPSDataSubscription(subscribeRequester: GPSDataConsumerDelegate) {
        self.gpsDataProvider.gpsDataConsumers.append(subscribeRequester)
    }
    
    func requestRotationDataSubscription(subscribeRequester: RotationDataConsumerDelegate) {
         self.rotationDataProvider.RotationDataConsumers.append(subscribeRequester)
     }
    func requestQuaternionDataSubscription(subscribeRequester: QuaternionDataConsumerDelegate) {
          self.quaternionDataProvider.QuaternionDataConsumers.append(subscribeRequester)
      }
}
