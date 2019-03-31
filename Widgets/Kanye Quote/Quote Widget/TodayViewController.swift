//
//  TodayViewController.swift
//  Quote Widget
//
//  Created by Majd on 2019-03-30.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var widgetLabel: UILabel!
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
                    self.widgetLabel.text = #""\#(kanyeQuote.quote)" - Kanye"#
                } catch {
                    print("[ERROR]: \(error)]")
                }
            }
        }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
