import CoreMotion
import Foundation

class BarometricDataProvider {
    
    let altimiter: CMAltimeter
    
    var barometerDataConsumers: [BarometerDataConsumerDelegate] = []
    
    init(altimiter: CMAltimeter) {
        self.altimiter = altimiter
    }
    
    func startDataProvider() {
        self.altimiter.startRelativeAltitudeUpdates(to: OperationQueue.main) { (data, error) in
            guard let data = data else { return }
            // Error handling has been omitted but should be incluided in this class
            
            // Conversion of the data to an agreed format can happen here
            // At the moment we are just converting putting the data into a custom type
            let processedData = NZBarometricPressure(pressureValue: Double(data.pressure.floatValue))
            
            // Print a logged description of the data and send to the consumers
            print(processedData.description)
            for consumer in self.barometerDataConsumers {
                consumer.receiveBarometricData(barometricData: processedData)
            }
        }
    }
}
