//
//  ViewController.swift
//  MediatorExample
//
//  Created by Nathan Ziabek on 06/05/2020.
//  Copyright © 2020 LivingMap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AccelerometerDataConsumerDelegate, BarometerDataConsumerDelegate, GPSDataConsumerDelegate {

    
    
    var manager: Manager? = nil
 
    @IBOutlet weak var accelXlabel: UILabel!
    @IBOutlet weak var accelYlabel: UILabel!
    @IBOutlet weak var accelZlabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var accelerationSwitch: UISwitch!
    @IBOutlet weak var pressureSwitch: UISwitch!
    @IBOutlet weak var gpsSwitch: UISwitch!
    
    let nilLabel: String = "nil"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = Manager()
        self.manager!.startSystem()
        self.manager!.requestAccelerometerDataSubscription(subscribeRequester: self)
        self.manager!.requestBarometerDataSubscription(subscribeRequester: self)
        self.manager!.requestGPSDataSubscription(subscribeRequester: self)
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
}

