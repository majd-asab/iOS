//
//  ResultVC.swift
//  Roshambo
//
//  Created by Majd on 2018-12-09.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    // MARK: properties
    var resultValue: Int?
    
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var imageOfResult: UIImageView!
    
    // MARK: string results
    let zero  =  "It's a tie"
    let one   = "Paper covers rock, you win!"
    let two   = "Rock beats scissors, you lose."
    let three = "Paper covers rock, you lose."
    let four  = "Scissors cut paper, you win!"
    let five  = "Rock beats scissors, you win!"
    let six   = "Scissors cut paper, you lose."
    let seven = "error"
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.green
        displayResult()
    }
    
    func displayResult() {
        if let resValue = resultValue {
            switch resValue {
            case 0:
                self.resultText.text = zero
            case 1:
                self.resultText.text = one
            case 2:
                self.resultText.text = two
            case 3:
                self.resultText.text = three
            case 4:
                self.resultText.text = four
            case 5:
                self.resultText.text = five
            case 6:
                self.resultText.text = six
            default:
                self.resultText.text = seven
            }
            
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
