//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Majd on 2019-01-16.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    // array to hold history of matches
    var history = [RPSMatch]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell")!
        let hist = self.history[(indexPath as NSIndexPath).row]
        
        // set info for text and label
        cell.textLabel?.text = "Winner: \(hist.winner)"
        cell.detailTextLabel?.text = "Loser: \(hist.loser)"
        
        return cell
        
    }
    
    @IBAction func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
