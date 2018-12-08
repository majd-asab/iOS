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
        
        // Image Picker
        let button =  UIButton()
        button.frame = CGRect(x: 60, y: 300, width: 300, height: 60)
        button.setTitle("display image picker", for: UIControl.State.normal)
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(imagePicker), for: UIControl.Event.touchUpInside)
        
        // Activity View
        let button2 =  UIButton()
        button2.frame = CGRect(x: 60, y: 400, width: 300, height: 60)
        button2.setTitle("display activity view", for: UIControl.State.normal)
        button2.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        self.view.addSubview(button2)
        
        button2.addTarget(self, action: #selector(self.activityView), for: UIControl.Event.touchUpInside)
        
        
        // Alert View
        let button3 =  UIButton()
        button3.frame = CGRect(x: 60, y: 500, width: 300, height: 60)
        button3.setTitle("display alert view", for: UIControl.State.normal)
        button3.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        self.view.addSubview(button3)
        
        button3.addTarget(self, action: #selector(self.alertView), for: UIControl.Event.touchUpInside)
    }
    
    @IBAction func imagePicker(sender: UIButton){
        print(sender.currentTitle ?? "value not found")
        let nextController = UIImagePickerController()
        
        self.present(nextController, animated: true, completion: nil)
    }
    
    @IBAction func activityView(sender: UIButton){
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func alertView(sender: UIButton){
        let controller = UIAlertController()
        controller.title = "Alert Test"
        controller.message  = "alert test"
        
        //must add dismiss action manually
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {action in
            self.dismiss(animated: true, completion: nil)
        })
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }


}

