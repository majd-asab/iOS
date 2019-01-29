//
//  ImageTextFieldDelegate.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-28.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import Foundation
import UIKit

class ImageTextFieldDelegate: NSObject, UITextFieldDelegate {
    var topTextTouched = false;
    var bottomTextTouched = false;
    
    // clear text field when user begins editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !self.topTextTouched && textField.text == "TOP TEXT" {
            textField.text = ""
            self.topTextTouched = true
        }
        
        if !self.bottomTextTouched && textField.text == "BOTTOM TEXT" {
            textField.text = ""
            self.bottomTextTouched = true
        }
    }
    
    // remove the keyboard when the user clicks return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
