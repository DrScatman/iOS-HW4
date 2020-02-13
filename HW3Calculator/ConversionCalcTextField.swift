//
//  ConversionCalcTextField.swift
//  HW3Calculator
//
//  Created by Xcode User on 2/13/20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class ConversionCalcTextField: UITextField {

    override func awakeFromNib() {
        self.textColor = FOREGROUND_COLOR
        self.tintColor = FOREGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.borderStyle = .roundedRect
        
        self.backgroundColor = UIColor.clear
        
        guard let ph = self.placeholder else {
            return
        }
        
        self.attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor : FOREGROUND_COLOR])
    }

}
