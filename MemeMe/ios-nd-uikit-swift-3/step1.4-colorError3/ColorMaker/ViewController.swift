//
//  ViewController.swift
//  ColorMaker
//
//  Created by Jason Schatz on 11/2/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redControl: UISlider!
    @IBOutlet weak var greenControl: UISlider!
    @IBOutlet weak var blueControl: UISlider!
    

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.redControl.minimumTrackTintColor = UIColor.red
        self.greenControl.minimumTrackTintColor = UIColor.green
        self.blueControl.minimumTrackTintColor = UIColor.blue
        
        
    }
    
    // MARK: Actions
    
    @IBAction func changeColorComponent(_ sender: UISlider) {
        
        let r: CGFloat = CGFloat(self.redControl.value)
        let g: CGFloat = CGFloat(self.greenControl.value)
        let b: CGFloat = CGFloat(self.blueControl.value)
        
            colorView.backgroundColor = UIColor(
                red: r, green: g, blue: b, alpha: 1)
    
    }
}

