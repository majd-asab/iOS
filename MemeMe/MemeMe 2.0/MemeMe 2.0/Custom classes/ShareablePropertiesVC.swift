//
//  ShareablePropertiesVC.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-30.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class ShareablePropertiesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Sent Memes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newMeme))
    }
    
   @IBAction func newMeme() {
        let newMemeVC = storyboard?.instantiateViewController(withIdentifier: "CreateMemeVC") as! CreateMemeVC
    
    self.present(newMemeVC, animated: true, completion: nil)
    }
}
