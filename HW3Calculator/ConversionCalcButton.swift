//
//  ConversionCalcButton.swift
//  HW3Calculator
//
//  Created by Xcode User on 2/14/20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class ConversionCalcButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = FOREGROUND_COLOR
        self.setTitleColor(BACKGROUND_COLOR, for: .normal)
        
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
    }

}
