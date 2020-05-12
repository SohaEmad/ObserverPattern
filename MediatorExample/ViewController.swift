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
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func startSystemButton(_ sender: Any) {
        self.manager?.startSystem()
    }
    
    @IBAction func getBaro(_ sender: Any) {
        guard let baroData = self.manager?.mediator.systemBarometricData else { return }
        self.appendToTextField(textToAppend: baroData.description)
    }
    
    @IBAction func getAccel(_ sender: Any) {
        guard let accelData = self.manager?.mediator.systemAccelerometerData else { return }
        self.appendToTextField(textToAppend: accelData.description)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = Manager()
        self.textView.text = ""
    }
    
    func appendToTextField(textToAppend: String) {
        self.textView.text = self.textView.text + "\n" + textToAppend
        self.scrollTextViewToBottom(textView: self.textView)
    }
    
    func scrollTextViewToBottom(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }


}

