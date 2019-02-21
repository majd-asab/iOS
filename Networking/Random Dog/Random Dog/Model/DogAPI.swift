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
    enum Endpoint {
        case randomImageFromAllDogsCollection
        case randomImageForBreed(String)
        case listOfAllBreeds
        var url : URL {
            return URL(string: self.stringValue)!
        }
        
        // computed property to use as associated value and return a new value for each breed
        // and random images
        var stringValue: String {
            switch self {
            case .randomImageFromAllDogsCollection:
                return "https://dog.ceo/api/breeds/image/random"
            case .randomImageForBreed(let breed):
                return "https://dog.ceo/api/breed/\(breed)/images/random"
            case .listOfAllBreeds:
                return "https://dog.ceo/api/breeds/list/all"
            }
        }
    }
    
    static func requestRandomImage(breed: String, completionHandler: @escaping (DogImage?, Error?) -> Void) {
        let url = DogAPI.Endpoint.randomImageForBreed(breed).url
        
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
    
    // function to return a list of all breeds
    func requestAllBreeds(completionHandler: @escaping ([String]?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: DogAPI.Endpoint.listOfAllBreeds.url) { (data, response, error) in
            guard let data = data else {
                print("failed to request data")
                completionHandler(nil, error)
                return
            }
            
            // return the keys of "message"
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let messageDic = json["message"] as! [String: Any]
                let list = messageDic.keys.map({$0})
                completionHandler(list, nil)
            } catch {
                print("error parsing json\(error)")
            }
        }
        task.resume()
    }
}


