//
//  NetworkLayer.swift
//  Kanye Quote
//
//  Created by Majd on 2019-03-29.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import Foundation
struct NetworkLayer {
    static let url = "https://api.kanye.rest"
    
    static func retrieveData(completion: @escaping ((Data?,Error?) -> Void)) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard error == nil else {
                print("Error occured")
                completion(nil,error)
                return
            }
            guard let data = data else {
                print("data is nil")
                completion(nil,error)
                return
            }
            completion(data,nil)
        }
        task.resume()
    }
}
