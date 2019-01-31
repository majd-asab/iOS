//
//  SentMemesVC.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-28.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class TableViewVC: ShareablePropertiesVC, UITableViewDelegate, UITableViewDataSource {

    var memes =  [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       self.memes = getMemesArray()
    }
    
    func getMemesArray() -> [Meme] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        let meme = self.memes[indexPath.row]
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text  = meme.topText
        cell.detailTextLabel?.text  = meme.bottomText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
