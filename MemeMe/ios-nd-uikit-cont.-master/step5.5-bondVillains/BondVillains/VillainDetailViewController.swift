//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Majd on 2019-01-20.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var villainImageView: UIImageView!
    @IBOutlet weak var villainDetailLabel: UILabel!
    
    // MARK: villain property
    var villainProperty: Villain!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.villainImageView.image  = UIImage(named: self.villainProperty.imageName)
        self.villainDetailLabel.text = self.villainProperty.name
    }

}
