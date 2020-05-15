import Foundation

// This is the protocol that the mediator object adopts.
// This allows the classes which access the source of the data to post to a central place by calling on objects
// adopt this protocol
protocol ProviderToMediatorDataDelegate: class {
    
    func acceleromterDataReceiver(accelerationData: NZAcceleration)
    func baromatricDataReceiver(barometerData: NZBarometricPressure)
    func gpsDataReceiver(gpsData: NZLocation)
    
}

// The following protocols are those which can be adopted by any other class that subscribe to the data processed by the mediator object

protocol AccelerometerDataConsumerDelegate: Any {
    func receiveAccelerometerData(accelerationData: NZAcceleration)
}

protocol BarometerDataConsumerDelegate: Any {
    func receiveBarometricData(barometricData: NZBarometricPressure)
}

protocol GPSDataConsumerDelegate: Any {
    func receiveGPSData(gpsData: NZLocation)
}
