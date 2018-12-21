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
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var editSwitch: UISwitch!
    
    // MARK: Text Field Delegate objects
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate    = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textField1.delegate = self.zipCodeTextFieldDelegate
        self.textField2.delegate = self.cashTextFieldDelegate
        self.textField3.delegate = self
        
        self.editSwitch.setOn(false, animated: false)
    }
    
    @IBAction func onSwitchTouch(_ sender: AnyObject) {
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editSwitch.isOn == true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }


}

