//
//  ViewController.swift
//  Text Fields
//
//  Created by Majd on 2018-12-19.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var textField1: UITextField!
    //    @IBOutlet weak var textField2: UITextField!
//    @IBOutlet weak var textField3: UITextField!
    
    // MARK: Text Field Delegate objects
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textField1.delegate = self.zipCodeTextFieldDelegate
    }


}

