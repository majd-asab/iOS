//
//  ViewController.swift
//  Click Counter
//
//  Created by Majd on 2018-12-01.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
//    {
//        didSet {
//            view.backgroundColor = self.colors.randomElement()
//        }
//    }
    @IBOutlet var label: UILabel!
//  var label2: UILabel!
    
    // color array
    let colors: [UIColor] = [.red, .blue, .yellow, .green, .black, .white]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // label
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 150, width: 60, height:60)
//        label.text = "0"
//        view.addSubview(label)
//        self.label = label
//
//        // label2
//        let label2 = UILabel()
//        label2.frame = CGRect(x: 210, y: 150, width: 60, height:60)
//        label2.text = "\(self.count)"
//        view.addSubview(label2)
//        self.label2 = label2
//
//        //button
//        let button = UIButton()
//        button.frame = CGRect(x: 100, y: 250, width: 100, height: 60)
//        button.setTitle("Increment", for: .normal)
//        button.setTitleColor( .blue, for: .normal)
//        button.tag = 1
//        view.addSubview(button)
//
//        button.addTarget(self, action: #selector(changeCount), for: UIControl.Event.touchUpInside)
//
//        //button
//        let button2 = UIButton()
//        button2.frame = CGRect(x: 210, y: 250, width: 100, height: 60)
//        button2.setTitle("Decrement", for: .normal)
//        button2.setTitleColor( .red, for: .normal)
//        button2.tag = -1
//        view.addSubview(button2)
//
//        button2.addTarget(self, action: #selector(changeCount), for: UIControl.Event.touchUpInside)
    }
    
//    @objc func changeCount(sender: UIButton) {
//        self.count += sender.tag
//        self.label.text = "\(self.count)"
//        self.label2.text = "\(self.count)"
//    }
    
    @objc func incremenetCount() {
        self.count += 1
        self.label.text = "\(self.count)"
    }
}

