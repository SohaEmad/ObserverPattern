import CoreMotion
import Foundation

class BarometricDataProvider {
    
    weak var dataMediator: ProviderToMediatorDataDelegate?
    let altimiter: CMAltimeter
    
    init(dataMediator: ProviderToMediatorDataDelegate, altimiter: CMAltimeter) {
        self.dataMediator = dataMediator
        self.altimiter = altimiter
    }
    
    func startDataProvider() {
        self.altimiter.startRelativeAltitudeUpdates(to: OperationQueue.main) { (data, error) in
            guard let data = data else { return }
            // Error handling has been omitted but should be incluided in this class
            
            // Conversion of the data to an agreed format can happen here
            // At the moment we are just converting putting the data into a custom type
            let processedData = NZBarometricPressure(pressureValue: Double(data.pressure.floatValue))
            print(processedData.description)
            
            self.dataMediator?.baromatricDataReceiver(barometerData: processedData)
        }
    }
}
