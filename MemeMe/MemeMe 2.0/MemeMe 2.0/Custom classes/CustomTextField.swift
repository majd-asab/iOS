//
//  CustomTextField.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-28.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    // MARK: String attributes
    
    let memeStringAttributes : [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.strokeWidth: -1.0,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!
    ]
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultTextAttributes = self.memeStringAttributes
        self.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        self.textAlignment = NSTextAlignment.center
        self.borderStyle = UITextField.BorderStyle.none
        
    }
    
}
