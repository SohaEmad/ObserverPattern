import Foundation

struct NZAcceleration: CustomStringConvertible {
    
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0
    
    var description: String {
        let description = "Acceleration -> x: " + self.x.description + ", y: " + self.y.description + ", z: " + self.z.description
        return description
    }
    
    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}
