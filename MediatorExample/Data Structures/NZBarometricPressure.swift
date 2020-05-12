import Foundation

struct NZBarometricPressure: CustomStringConvertible {
    
    var pressure: Double = 0.0
    
    var description: String {
        let description: String = "Pressure -> " + self.pressure.description
        return description
    }
    
    init(pressureValue: Double) {
        self.pressure = pressureValue
    }
}
