//
//  ViewController.swift
//  Kanye Quote
//
//  Created by Majd on 2019-03-29.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widgetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        NetworkLayer.retrieveData { (data, error) in
            guard error == nil else {
                print(error ?? "unknown error")
                return
            }
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let kanyeQuote = try decoder.decode(KanyeQuote.self, from: data)
                    self.widgetLabel.text = #""\#(kanyeQuote.quote)" - Kanye"#
                } catch {
                    print("[ERROR]: \(error)]")
                }
            }
        }

    }
    

    @IBAction func creditsButtonPressed(_ sender: UIButton) {
        if let stringURL = sender.titleLabel?.text {
            if let url = URL(string: stringURL) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
}

