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
    
    @IBOutlet weak var accelSwitch: UISwitch!
    @IBOutlet weak var pressureSwitch: UISwitch!
    @IBOutlet weak var systemSwitch: UISwitch!
    
    var accelListener:(NZAcceleration) -> (String, String, String) = { data in
        let xValue = data.x.description
        let yValue = data.y.description
        let zValue = data.z.description
        return(xValue, yValue, zValue)
    }
    
    var pressureListener:(NZBarometricPressure) -> (String) = { data in
        let pressureValue = data.pressure.description
        return(pressureValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = Manager()

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
    
    func deployListener() {
        
    }


}

