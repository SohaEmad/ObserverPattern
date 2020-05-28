//
//  ViewController.swift
//  MediatorExample
//
//  Created by Nathan Ziabek on 06/05/2020.
//  Copyright © 2020 LivingMap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AccelerometerDataConsumerDelegate, BarometerDataConsumerDelegate, GPSDataConsumerDelegate, RotationDataConsumerDelegate, QuaternionDataConsumerDelegate {

    
    
    
    
    var manager: Manager? = nil
 
    @IBOutlet weak var accelXlabel: UILabel!
    @IBOutlet weak var accelYlabel: UILabel!
    @IBOutlet weak var accelZlabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var rotationLabel: UILabel!
    @IBOutlet weak var quatXLabel: UILabel!
    @IBOutlet weak var quatYLabel: UILabel!
    @IBOutlet weak var quatZLabel: UILabel!
    @IBOutlet weak var quatWLabel: UILabel!
    
    @IBOutlet weak var accelerationSwitch: UISwitch!
    @IBOutlet weak var pressureSwitch: UISwitch!
    @IBOutlet weak var gpsSwitch: UISwitch!
    @IBOutlet weak var rotationSwitch: UISwitch!
    
    let nilLabel: String = "nil"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = Manager()
        self.manager!.startSystem()
        self.manager!.requestAccelerometerDataSubscription(subscribeRequester: self)
        self.manager!.requestBarometerDataSubscription(subscribeRequester: self)
        self.manager!.requestGPSDataSubscription(subscribeRequester: self)
        self.manager!.requestRotationDataSubscription(subscribeRequester: self)
        self.manager!.requestQuaternionDataSubscription(subscribeRequester: self)

    }
    
    func receiveAccelerometerData(accelerationData: NZAcceleration) {
        if self.accelerationSwitch.isOn {
            self.accelXlabel.text = accelerationData.x.description
            self.accelYlabel.text = accelerationData.y.description
            self.accelZlabel.text = accelerationData.z.description
        } else {
            self.accelXlabel.text = self.nilLabel
            self.accelYlabel.text = self.nilLabel
            self.accelZlabel.text = self.nilLabel
        }
        
    }
    
    func receiveBarometricData(barometricData: NZBarometricPressure) {
        if self.pressureSwitch.isOn {
            self.pressureLabel.text = barometricData.pressure.description
        } else {
            self.pressureLabel.text = self.nilLabel
        }
    }
    
    func receiveGPSData(gpsData: NZLocation) {
        if self.gpsSwitch.isOn {
            self.latitudeLabel.text = gpsData.latitude.description
            self.longitudeLabel.text = gpsData.longitude.description
        } else {
            self.latitudeLabel.text = self.nilLabel
            self.longitudeLabel.text = self.nilLabel
        }
    }
    
    
     func receiveRotationData(rotationData: SARotation) {
        if self.rotationSwitch.isOn {
            self.rotationLabel.text = rotationData.rotationValue.description

            } else {
                      self.rotationLabel.text = self.nilLabel

            }
     }
     func receiveQuaternionData(quaternionData: SAQuaternion) {
         if self.rotationSwitch.isOn {
            self.quatXLabel.text = quaternionData.x.description
            self.quatYLabel.text = quaternionData.y.description
            self.quatZLabel.text = quaternionData.z.description
            self.quatWLabel.text = quaternionData.w.description

             } else {
            self.quatXLabel.text = self.nilLabel
            self.quatYLabel.text = self.nilLabel
            self.quatZLabel.text = self.nilLabel
            self.quatWLabel.text = self.nilLabel

             }
     }
    
    func createCSVX(from recArray:[Dictionary<String, AnyObject>]) {

        // No need for string interpolation ("\("Time"),\("Force")\n"), just say what you want:
        let heading = "Time, Force\n"

        // For every element in recArray, extract the values associated with 'T' and 'F' as a comma-separated string.
        // Force-unwrap (the '!') to get a concrete value (or crash) rather than an optional
        let rows = recArray.map { "\($0["T"]!),\($0["F"]!)" }

        // Turn all of the rows into one big string
        let csvString = heading + rows.joined(separator: "\n")

        do {

            let path = try FileManager.default.url(for: .documentDirectory,
                                                   in: .allDomainsMask,
                                                   appropriateFor: nil,
                                                   create: false)

            let fileURL = path.appendingPathComponent("TrailTime.csv")
            try csvString.write(to: fileURL, atomically: true , encoding: .utf8)
        } catch {
            print("error creating file")
        }
    }
     
}

