//
//  MYOAViewController.swift
//  The Tiger
//
//  Created by Majd on 2019-01-19.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class MYOAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc func startOver() {
        if let navController = self.navigationController {
            navController.popToRootViewController(animated: true)
        }
    }
    
    deinit {
        print("VC poped off stack")
    }

}
