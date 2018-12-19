//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Majd on 2018-12-19.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelage: NSObject, UITextFieldDelegate {
    
    func randomColor() -> UIColor {
        let arrayOfColors: [UIColor] = [.black, .blue, .gray, .green, .red, .yellow]
        let randomIndexOfColor: Int = Int.random(in: 0..<arrayOfColors.count)
        return arrayOfColors[randomIndexOfColor]
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        return true
    }
}
