//
//  CashTextFieldDelegate.swift
//  Text Fields
//
//  Created by Majd on 2018-12-20.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import Foundation
import UIKit

// MARK: A dollar sign field that begins with the text $0.00, and then fills in the dollar figure as digits are added. For example, typing 4-2-7-5 would produce $0.00, $0.04, $0.42, $4.27, $42.75.
class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var cashArray: [String] = ["0", "0", "0", "0"]
    var cashArrayPointer: Int = 4
    
    func returnArrayPointer() -> Int {
        if cashArrayPointer - 1 <= -1 {
            cashArrayPointer = 3
        }else {
            cashArrayPointer -= 1
        }
        return cashArrayPointer
    }
    
    // Check if character is numberic
    func isNumeric(string: String) -> Bool {
        if string == "" || string.count > 1 { return false }
        return Set(string).isSubset(of: self.nums)
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if self.isNumeric(string: string) {
            cashArray[returnArrayPointer()] = string
            let newString = "$\(cashArray[0])\(cashArray[1]).\(cashArray[2])\(cashArray[3])"
            textField.text  = newString
        }
        return false
    }
    
}
