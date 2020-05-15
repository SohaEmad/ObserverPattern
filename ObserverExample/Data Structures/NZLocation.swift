import Foundation

struct NZLocation: CustomStringConvertible {
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var description: String {
        let description: String = "GPS -> Lat: " + self.latitude.description + ", Long: " + self.longitude.description
        return description
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
