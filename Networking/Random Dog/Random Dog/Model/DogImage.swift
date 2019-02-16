//
//  DogImage.swift
//  Random Dog
//
//  Created by Majd on 2019-02-16.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import Foundation

// Object that models data from random api endpoint
struct DogImage: Codable {
    let status: String
    let message: String
    
}
