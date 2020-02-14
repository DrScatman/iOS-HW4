//
//  SettingsViewController.swift
//  HW3Calculator
//
//  Created by Xcode User on 1/31/20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsChangedLength(fromUnits: String, toUnits: String)
    func settingsChangedVolume(fromUnits: String, toUnits: String)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    internal var isLengthMode: Bool = true
    internal var unitLabel1 = UILabel()
    internal var unitLabel2 = UILabel()
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    var isTo: Bool = Bool()
    
    internal var delegate: SettingsViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (isLengthMode) {
            pickerData = ["Meter(s)", "Yard(s)", "Mile(s)"]
        }
        else {
            pickerData = ["Gallon(s)", "Liter(s)", "Quart(s)"]
        }
        picker.delegate = self
        picker.dataSource = self
        
        button1.setTitle(unitLabel1.text, for: .normal)
        button2.setTitle(unitLabel2.text, for: .normal)
        
        let tapFrom = UITapGestureRecognizer(target: self, action: #selector(self.onButton1Pressed(_:)))
        self.button1.addGestureRecognizer(tapFrom)
        
        let tapTo = UITapGestureRecognizer(target: self, action: #selector(self.onButton2Pressed(_:)))
        self.button2.addGestureRecognizer(tapTo)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hidePicker))
        self.view.addGestureRecognizer(tap)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    @objc func hidePicker() {
        picker.isHidden = true
    }
    
    @IBAction func onButton1Pressed(_ sender: Any) {
        picker.reloadAllComponents()
        picker.isHidden = false
        isTo = true
    }
    
    @IBAction func onButton2Pressed(_ sender: Any) {
        picker.reloadAllComponents()
        picker.isHidden = false;
        isTo = false
    }
    
    @IBAction func onCancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSavePressed(_ sender: Any) {
        if let d = delegate {
            d.settingsChangedLength(fromUnits: button1.currentTitle!, toUnits: button2.currentTitle!)
            
            dismiss(animated: true, completion: nil)
        }
    }
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if self.isTo {
            self.button1.setTitle(self.pickerData[row], for: .normal)
        } else {
            self.button2.setTitle(self.pickerData[row], for: .normal)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UINavigationController {
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

