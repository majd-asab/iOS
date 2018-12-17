//
//  ViewController.swift
//  Roshambo
//
//  Created by Majd on 2018-12-09.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rockButton     = UIButton()
        let paperButton    = UIButton()
        let scissorsButton = UIButton()
        
        rockButton.setTitle("rock", for: UIControl.State.normal)
        paperButton.setTitle("paper", for: UIControl.State.normal)
        scissorsButton.setTitle("scissors", for: UIControl.State.normal)
        
        rockButton.frame = CGRect(x: 50, y: 150, width: 100, height: 100)
        paperButton.frame = CGRect(x: 110, y: 150, width: 100, height: 100)
        scissorsButton.frame = CGRect(x: 190, y: 150, width: 100, height: 100)
        
        rockButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        paperButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        scissorsButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        
        rockButton.tag     = 1
        paperButton.tag    = 2
        scissorsButton.tag = 3
        
        rockButton.setImage(UIImage(named: "rock"), for: .normal)
        
        view.addSubview(rockButton)
        view.addSubview(paperButton)
        view.addSubview(scissorsButton)
        
        rockButton.addTarget(self, action: #selector(self.playRock), for: UIControl.Event.touchUpInside)
        
        paperButton.addTarget(self, action: #selector(self.playPaper), for: UIControl.Event.touchUpInside)
        
        scissorsButton.addTarget(self, action: #selector(self.playScissors), for: UIControl.Event.touchUpInside)
        
    }
    
    enum Shape: String, CaseIterable {
        case Rock    = "Rock"
        case Paper   = "Paper"
        case Scissor = "Scissors"
        
        // randomly choose opponent's choice
        static func randomChoice() -> String {
            let rc = Shape.allCases.randomElement()
            return rc?.rawValue ?? "Rock"
        }
    }
    
    func opponentsHand() -> Int {
        let randomHand = Int.random(in: 1..<4)
        return randomHand
    }
    
    
    func play(sender: UIButton) -> Int {
        let opponentsResult: Int = opponentsHand()
        let sendersId = sender.tag
        
        var result : Int
        
        switch (opponentsResult,sendersId) {
        case (1,1), (2,2), (3,3):
            result = 0
        case (1,2):
            result = 1
        case (1,3):
            result = 2
        case (2,1):
            result = 3
        case (2,3):
            result = 4
        case (3,1):
            result = 5
        case (3,2):
            result = 6
        default:
            result = 7
        }
        
        return result
    }
    
    
    // MARK: programmatic approach to present view controller
    
    @IBAction func playRock(_ sender: UIButton) {
        let result: Int = self.play(sender: sender)
        let resultVC : ResultVC
        resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
        resultVC.resultValue = result
        self.present(resultVC, animated: true, completion: nil)
    }
    
    // MARK: segue with code approach
    
    @IBAction func playPaper(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToResultVC", sender: sender)
    }
    
    @IBAction func playScissors(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToResultVC", sender: sender)
    }
    
    // prepare segue information to pass
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResultVC" {
            let controller = segue.destination as! ResultVC
            let result: Int = self.play(sender: sender as! UIButton)
            controller.resultValue = result
        }
    }
    
    

}

