//
//  ViewController.swift
//  HW3Calculator
//
//  Created by Xcode User on 1/30/20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class ViewController: UIViewController & UITextFieldDelegate {
    
    @IBOutlet weak var fromInput: UITextField!
    @IBOutlet weak var toOutput: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(dectTouch)
        
        fromInput.addTarget(self, action: #selector(UITextFieldDelegate.textFieldDidBeginEditing(_:)), for: UIControl.Event.editingDidBegin)
    }
    
    @IBAction func onCalculatePressed(_ sender: Any) {
        if (fromInput != nil) {
            var tempFloat : Float! = Float(fromInput.text!)
            if (tempFloat != nil) {
                toOutput.text = "\(tempFloat! * 0.9144)"
            }
        }
        
        dismissKeyboard()
    }
    
    @IBAction func onClearPressed(_ sender: Any)
    {
            fromInput.text = ""
            toOutput.text = ""
    }
    
    @objc func dismissKeyboard(){
            self.view.endEditing(true);
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.isEqual(fromInput)) {
            toOutput.text = ""
        }
    }
    
    @IBAction func onModePressed(_ sender: Any) {
        if (label1.text == "Yard(s)") {
            labelTitle.text = "Volume Conversion Calculator"
            label1.text = "Gallon(s)"
            label2.text = "Liter(s)"
            fromInput.placeholder = "Enter volume in Gallons"
            toOutput.placeholder = "Enter volume in Liters"
        }
        else
        {
            labelTitle.text = "Length Conversion Calculator"
            label1.text = "Yard(s)"
            label2.text = "Meter(s)"
            fromInput.placeholder = "Enter length in Yards"
            toOutput.placeholder = "Enter length in Meters"
        }
    }
}

