import CoreLocation
import Foundation

class GPSDataProvider: NSObject, CLLocationManagerDelegate{
    
    let locationManager: CLLocationManager?
    
    var gpsDataConsumers: [GPSDataConsumerDelegate] = []
    
    var authorisation: Bool = false
    
    init(motionManager: CLLocationManager) {
        self.locationManager = motionManager
    }
    
    func startDataProvider() {
        // Setting self to receive location updates from the locationManager object
        self.locationManager?.delegate = self
        
        // Asking for permissions
        if let locationManager = self.locationManager {
            if  !self.authorisation {
                locationManager.requestWhenInUseAuthorization()
                // or self.locationManager.requestAlwaysAuthorization()
            } else {
                return
            }
            locationManager.startUpdatingLocation()
        }
    }
    
    // Delegate Object
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0].coordinate
        // Error handling has been omitted but should be incluided in this class
        
        // Conversion of the data to an agreed format can happen here
        // At the moment we are just converting putting the data into a custom type
        let processedLocation = NZLocation(latitude: location.latitude, longitude: location.longitude)
        
        // Print a logged description of the data and send to the consumers
        print(processedLocation.description)
        for consumer in self.gpsDataConsumers {
            consumer.receiveGPSData(gpsData: processedLocation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let authorisation: Bool
        switch status {
        case .authorizedAlways: authorisation = true
        case .authorizedWhenInUse: authorisation = true
        case .denied: authorisation = false
        case .notDetermined: authorisation = false
        case .restricted: authorisation = false
        default: authorisation = false
        }
        self.authorisation = authorisation
    }
}
