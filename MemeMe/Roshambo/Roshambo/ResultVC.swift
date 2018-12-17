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
            let name: String
            switch resValue {
            case 0:
                self.resultText.text = zero
                name = "itsATie"
            case 1:
                self.resultText.text = one
                name = "PaperCoversRock"
            case 2:
                self.resultText.text = two
                name = "RockCrushesScissors"
            case 3:
                self.resultText.text = three
                 name = "PaperCoversRock"
            case 4:
                self.resultText.text = four
                 name = "ScissorsCutPaper"
            case 5:
                self.resultText.text = five
                name = "RockCrushesScissors"
            case 6:
                self.resultText.text = six
                name = "ScissorsCutPaper"
            default:
                self.resultText.text = seven
                name = "itsATie"
            }
            self.imageOfResult.image = UIImage(named: name)
        }
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
