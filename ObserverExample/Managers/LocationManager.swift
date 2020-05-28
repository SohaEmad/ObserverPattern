//
//  LocationManager.swift
//  ObserverExample
//
//  Created by Soha Ahmed on 27/05/2020.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, Provider {

let locationManager: CLLocationManager?
 
    init(motionManager: CLLocationManager) {
          self.locationManager = motionManager
      }
    func startDataProvider() {
           
       }
       
       func stopDataProvider() {
           
       }

} 
