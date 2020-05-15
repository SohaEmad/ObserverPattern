import Foundation
import CoreMotion

class Mediator: ProviderToMediatorDataDelegate {

    var accelerometerDataConsumers: [AccelerometerDataConsumerDelegate] = []
    var barometerDataConsumers: [BarometerDataConsumerDelegate] = []
    var gpsDataConsumers: [GPSDataConsumerDelegate] = []
    
    init() {
    }
    
    func acceleromterDataReceiver(accelerationData: NZAcceleration) {
        for consumer in self.accelerometerDataConsumers {
            consumer.receiveAccelerometerData(accelerationData: accelerationData)
        }
    }
    
    func baromatricDataReceiver(barometerData: NZBarometricPressure) {
        for consumer in self.barometerDataConsumers {
            consumer.receiveBarometricData(barometricData: barometerData)
        }
    }
    
    func gpsDataReceiver(gpsData: NZLocation) {
        for consumer in self.gpsDataConsumers {
            consumer.receiveGPSData(gpsData: gpsData)
        }
    }
    
}
