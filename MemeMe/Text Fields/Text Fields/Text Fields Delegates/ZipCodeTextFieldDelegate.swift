//
//  ZipCodeTextFieldDelegate.swift
//  Text Fields
//
//  Created by Majd on 2018-12-19.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import Foundation
import UIKit

// MARK: A text field that allows only digits, and a maximum of five characters.


class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    
    // Check if character is numberic
    func isNumeric(string: String) -> Bool {
        if string == "" || string.count > 1 { return false }
        return Set(string).isSubset(of: self.nums)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be if we return new
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        if self.isNumeric(string: string) && newText.length < 6 {
            return true
        }else {
            return false
        }
    }
}
