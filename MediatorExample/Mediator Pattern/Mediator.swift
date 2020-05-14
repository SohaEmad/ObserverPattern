import Foundation
import CoreMotion

class Mediator {
    
    var accelListener: ((NZAcceleration) -> Void)?
    var barometricListener: ((NZBarometricPressure) -> Void)?
    var gpsLocationListener: ((NZLocation) -> Void)?
    
    var systemAccelerometerData: NZAcceleration? {
        willSet {
            if let listener = self.accelListener {
                return listener(newValue!)
            }
        }
    }
    
    var systemBarometricData: NZBarometricPressure? {
        willSet {
            if let listener =  self.barometricListener {
                return listener(newValue!)
            }
        }
    }
    
    var systemGPSData: NZLocation? {
        willSet {
            if let listener = self.gpsLocationListener {
                return listener(newValue!)
            }
        }
    }
    
    init() {
    }
}
