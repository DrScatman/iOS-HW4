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
    
    internal var delegate: SettingsViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (isLengthMode) {
            pickerData = ["Meters", "Yards", "Miles"]
        }
        else {
            pickerData = ["Gallons", "Liters", "Quarts"]
        }
        
        button1.setTitle(unitLabel1.text, for: .normal)
        button2.setTitle(unitLabel2.text, for: .normal)
    }
    
    @IBAction func onButton1Pressed(_ sender: Any) {
        picker.isHidden = false
    }
    
    @IBAction func onButton2Pressed(_ sender: Any) {
        picker.isHidden = false;
    }
    
    @IBAction func onSavePressed(_ sender: Any) {
        if let d = delegate {
            d.settingsChangedLength(fromUnits: button1.currentTitle!, toUnits: button2.currentTitle!)
            
            performSegue(withIdentifier: "return", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier ==  "save") {

//            let vc = segue.destination as! ViewController
//            vc.label1.text = button1.currentTitle
//            vc.label2.text = button2.currentTitle

//            delegate?.settingsChangedLength(fromUnits: button1.currentTitle!, toUnits: button2.currentTitle!)

        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
