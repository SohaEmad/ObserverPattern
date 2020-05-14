//
//  ViewController.swift
//  MediatorExample
//
//  Created by Nathan Ziabek on 06/05/2020.
//  Copyright © 2020 LivingMap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manager: Manager? = nil
 
    @IBOutlet weak var accelXlabel: UILabel!
    @IBOutlet weak var accelYlabel: UILabel!
    @IBOutlet weak var accelZlabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    let nilLabel: String = "nil"
    
    @IBAction func accelToggle(_ sender: UISwitch) {
        if sender.isOn {
            self.manager?.mediator.accelListener = { data in
                self.accelXlabel.text = data.x.description
                self.accelYlabel.text = data.y.description
                self.accelZlabel.text = data.z.description
            }
        } else {
            self.manager?.mediator.accelListener = nil
            self.accelXlabel.text = self.nilLabel
            self.accelYlabel.text = self.nilLabel
            self.accelZlabel.text = self.nilLabel
        }
    }
    
    @IBAction func pressureToggle(_ sender: UISwitch) {
        if sender.isOn {
            self.manager?.mediator.barometricListener = { data in
                self.pressureLabel.text = data.pressure.description
            }
        } else {
            self.manager?.mediator.barometricListener = nil
            self.pressureLabel.text = self.nilLabel
        }
    }
    
    @IBAction func gpsToggle(_ sender: UISwitch) {
        if sender.isOn {
            self.manager?.mediator.gpsLocationListener = { data in
                self.latitudeLabel.text = data.latitude.description
                self.longitudeLabel.text = data.longitude.description
            }
        } else {
            self.manager?.mediator.gpsLocationListener = nil
            self.latitudeLabel.text = self.nilLabel
            self.longitudeLabel.text = self.nilLabel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = Manager()
        self.manager?.startSystem()
        
    }
    
    //    func appendToTextField(textToAppend: String) {
    //        self.textView.text = self.textView.text + "\n" + textToAppend
    //        self.scrollTextViewToBottom(textView: self.textView)
    //    }
    
    func scrollTextViewToBottom(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
}

