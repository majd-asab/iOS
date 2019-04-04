//
//  Capital.swift
//  MapTutorial
//
//  Created by Majd on 2019-04-04.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var info: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.info  = info
        self.coordinate = coordinate
    }


}
