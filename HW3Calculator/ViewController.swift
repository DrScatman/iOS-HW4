//
//  ViewController.swift
//  HW3Calculator
//
//  Created by Xcode User on 1/30/20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SettingsViewControllerDelegate {
    
    var label1Name: String = "Yard(s)"
    var label2Name: String = "Meter(s)"
    
    func settingsChangedLength(fromUnits: String, toUnits: String) {
        label1Name = fromUnits
        label2Name = toUnits
    }
    
    func settingsChangedVolume(fromUnits: String, toUnits: String) {
        label1.text = fromUnits
        label2.text = toUnits
    }
    
    
    @IBOutlet weak var fromInput: UITextField!
    @IBOutlet weak var toOutput: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    var isFrom: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeUnitOutlets(unit1: label1Name, unit2: label2Name)
        
        // Do any additional setup after loading the view.
        let dectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(dectTouch)
        
        fromInput.addTarget(self, action: #selector(UITextFieldDelegate.textFieldDidBeginEditing(_:)), for: UIControl.Event.editingDidBegin)
        toOutput.addTarget(self, action: #selector(UITextFieldDelegate.textFieldDidBeginEditing(_:)), for: UIControl.Event.editingDidBegin)
        
        fromInput.addTarget(self, action: #selector(setFromCalc), for: UIControl.Event.editingDidBegin)
        toOutput.addTarget(self, action: #selector(setToCalc), for: UIControl.Event.editingDidBegin)
    }
    
    @objc func setFromCalc() {
        isFrom = true
    }
    
    @objc func setToCalc() {
        isFrom = false
    }
    
    @IBAction func onCalculatePressed(_ sender: Any) {
        if ((isFrom && fromInput.text! != "") || (!isFrom && toOutput.text! != "")) {
            if (isLengthMode()) {
                let from = LengthUnit(rawValue: label1Name)
                let to = LengthUnit(rawValue: label2Name)
            
                let convKey =  LengthConversionKey(toUnits: (isFrom) ? to! : from!, fromUnits: (isFrom) ? from! : to!)
                let tempDouble : Double! = Double((isFrom) ? fromInput.text! : toOutput.text!)
                let toVal = tempDouble * lengthConversionTable[convKey]!
                if (isFrom) {
                    toOutput.text = "\(toVal)"
                }
                else
                {
                    fromInput.text = "\(toVal)"
                }
            }
            else {
                let from = VolumeUnit(rawValue: label1Name)
                let to = VolumeUnit(rawValue: label2Name)
            
                let convKey =  VolumeConversionKey(toUnits: (isFrom) ? to! : from!, fromUnits: (isFrom) ? from! : to!)
                let tempDouble : Double! = Double((isFrom) ? fromInput.text! : toOutput.text!)
                let toVal = tempDouble * volumeConversionTable[convKey]!
                if (isFrom) {
                    toOutput.text = "\(toVal)"
                }
                else
                {
                    fromInput.text = "\(toVal)"
                }
            }
        }
        
        label1Name = label1.text!
        label2Name = label2.text!
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
    
    func isLengthMode() -> Bool {
        switch (label1Name) {
            case "Yard(s)":
                return true
            case "Meter(s)":
                return true
            case "Mile(s)":
                return true
            default:
                return false
        }
    }
    
    func changeUnitOutlets(unit1: String, unit2: String) {
        label1.text = unit1
        label2.text = unit2
        
        let measurment: String = (isLengthMode()) ? "length" : "volume"
        fromInput.placeholder = "Enter \(measurment) in \(label1Name)"
        toOutput.placeholder = "Enter \(measurment) in \(label2Name)"
        
        labelTitle.text = measurment.capitalized(with: Locale.current)
    }
    
    @IBAction func onModePressed(_ sender: Any) {
        if (isLengthMode()) {
            //labelTitle.text = "Volume Conversion Calculator"
            label1Name = "Gallon(s)"
            label2Name = "Liter(s)"
            changeUnitOutlets(unit1: label1Name, unit2: label2Name)
        }
        else
        {
            //labelTitle.text = "Length Conversion Calculator"
            label1Name = "Yard(s)"
            label2Name = "Meter(s)"
            changeUnitOutlets(unit1: label1Name, unit2: label2Name)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sVC = segue.destination as! SettingsViewController
        sVC.delegate = self
        
        if (isLengthMode()) {
            sVC.isLengthMode = true
        }
        else
        {
            sVC.isLengthMode = false
        }
        
        sVC.unitLabel1 = label1
        sVC.unitLabel2 = label2
    }
}

