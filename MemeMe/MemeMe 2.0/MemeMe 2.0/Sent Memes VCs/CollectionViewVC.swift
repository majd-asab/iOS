//
//  CollectionVC.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-28.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewVC: UICollectionViewController, ShareableNavigationBar {

    
    // Accessing memes array via computed property
    var memes = [Meme]()
    
    // control items in grid
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupNavigationBar(title: "Sent Memes")
        
        // organize the items in the grid
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space // space between items in the same row
        flowLayout.minimumLineSpacing = space // space between rows
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memes = getMemes()
        self.collectionView.reloadData()
    }
    
    // func to get and store memes
    func getMemes() -> [Meme] {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // number of items in array
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    // return cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let meme = self.memes[indexPath.row]
        
        cell.collectionMemeLabel.text = meme.topText
        cell.collectionMemeImageView.image = meme.memedImage
        
        return cell
    }
    
    // upon selection of cell
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailedMemeVC") as! DetailedMemeVC
        let meme = self.memes[indexPath.row]
        controller.meme = meme
        self.navigationController?.pushViewController(controller, animated: true)
        
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
    

}
