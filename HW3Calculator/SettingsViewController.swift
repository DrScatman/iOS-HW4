//
//  SettingsViewController.swift
//  HW3Calculator
//
//  Created by Xcode User on 1/31/20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButton1Pressed(_ sender: Any) {
        print("Button pressed")
    }
    
    @IBAction func onButton2Pressed(_ sender: Any) {
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
