//
//  ViewController.swift
//  StreetName
//
//  Created by Majd on 2019-04-04.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getStreetName(latitude: 43.624848, longitude: -79.677183) { placemark, error in
            guard let placemark = placemark else {
                print(error ?? "unknown error")
                return
            }
            
            print(placemark[0].name ?? "unknown")
            
        }
    }
    
    func getStreetName(latitude: Double, longitude: Double,  completionHandler: @escaping ( [CLPlacemark]?, Error?) -> Void) {
        let CL = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        CL.reverseGeocodeLocation(location) { placemark, error in
            guard let placemark = placemark else {
                completionHandler(nil,error)
                return
            }
            completionHandler(placemark,nil)
        }
    }


}

