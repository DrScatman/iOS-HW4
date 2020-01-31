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
        let dectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(dectTouch)
    }
    
    @IBAction func onCalculatePressed(_ sender: Any) {
        if (fromInput != nil) {
            var f : Float! = Float(fromInput.text!)
            if (f != nil) {
                toOutput.text = "\(f! * 0.9144)"
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
}

