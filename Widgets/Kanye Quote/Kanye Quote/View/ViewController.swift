//
//  ViewController.swift
//  Kanye Quote
//
//  Created by Majd on 2019-03-29.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkLayer.retrieveData { (data, error) in
            guard error == nil else {
                print(error ?? "unknown error")
                return
            }
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let kanyeQuote = try decoder.decode(KanyeQuote.self, from: data)
                    print(kanyeQuote.quote)
                } catch {
                    print("[ERROR]: \(error)]")
                }
            }
        }

    }


}

