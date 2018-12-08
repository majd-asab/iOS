//
//  ViewController.swift
//  Simple Image Picker
//
//  Created by Majd on 2018-12-08.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button =  UIButton()
        button.frame = CGRect(x: 100, y: 300, width: 300, height: 60)
        button.setTitle("display image picker", for: UIControl.State.normal)
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(experiment), for: UIControl.Event.touchUpInside)
    }
    
    @IBAction func experiment(sender: UIButton){
        print(sender.currentTitle ?? "value not found")
        let nextController = UIImagePickerController()
        
        self.present(nextController, animated: true, completion: nil)
    }


}

