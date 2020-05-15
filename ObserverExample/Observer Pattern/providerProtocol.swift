import Foundation
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
