//
//  DetailedViewVC.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-02-03.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class DetailedMemeVC: UIViewController {

    var meme: Meme!
  
    // why didnt setting it straight from the table & collection ViewControllers not work??
    @IBOutlet weak var detailedMemeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.detailedMemeImage.image = meme.memedImage
    }

}
