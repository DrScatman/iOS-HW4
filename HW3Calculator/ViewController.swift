//
//  ViewController.swift
//  HW3Calculator
//
//  Created by Xcode User on 1/30/20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromInput: UITextField!
    @IBOutlet weak var toOutput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCalculatePressed(_ sender: Any) {
        if (fromInput != nil) {
            var f : Float! = Float(fromInput.text!)
            toOutput.text = "\(f! * 0.9144)"
        }
        
        dismissKeyboard()
    }
    
        @objc func dismissKeyboard(){
            self.view.endEditing(true);
        }
}

