//
//  CollectionVC.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-28.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class CollectionViewVC: UIViewController, ShareableNavigationBar {

    // Accessing memes array via computed property
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // setting the title and the right button to trigger new meme func
    func setupNavigationBar(title: String) {
        self.navigationItem.title = title
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(newMeme))
    }
    
    // func to present the create new meme
   @objc func newMeme() {
    let controller = storyboard?.instantiateViewController(withIdentifier: "CreateMemeVC") as! CreateMemeVC
    self.present(controller, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar(title: "Sent Memes")
    }

}
