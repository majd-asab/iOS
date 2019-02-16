//
//  DogAPI.swift
//  Random Dog
//
//  Created by Majd on 2019-02-16.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import Foundation
import UIKit

struct DogAPI {
    enum Endpoint: String {
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
    
        var url : URL {
            return URL(string: self.rawValue)!
        }
    }
    
    static func requestRandomImage(completionHandler: @escaping (DogImage?, Error?) -> Void) {
        let url = DogAPI.Endpoint.randomImageFromAllDogsCollection.url
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Data came back as nil")
                completionHandler(nil,error)
                return
            }
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            completionHandler(imageData, nil)
        }
        task.resume()
    }
    
    static func requestImageFile(url: URL, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let data = data else {
                print("Data came back as nil")
                completionHandler(nil,error)
                return
            }
            let image = UIImage(data: data)
            completionHandler(image, nil)
        })
        task.resume()
    }
}
