//
//  SentMemesVC.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-28.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource,ShareableNavigationBar {

    @IBOutlet weak var tableView: UITableView!
    
    var memes =  [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
        setupNavigationBar(title: "Sent Memes")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.memes = getMemesArray()
        self.tableView.reloadData()
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
