//
//  ViewController.swift
//  Random Dog
//
//  Created by Majd on 2019-02-16.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DogAPI.requestRandomImage(completionHandler: handleRandomImageRequest(imageData:error:))
    }

    // helper function to pass image url to image file request func
    func handleRandomImageRequest(imageData: DogImage?, error: Error?) {
        guard let imageUrl = URL(string: imageData?.message ?? "") else {
            print("failed to find a valid dog api url")
            return
        }
        DogAPI.requestImageFile(
            url: imageUrl,
            completionHandler:handleImageFileResponse(image:error:))
    }
    
    // helper function to update view
    func handleImageFileResponse(image: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            self.dogImageView.image = image
        }
    }
    
    // function to convert JSON data to a dictionary (foundation objects)
    func convertJSONDataToDictionary(data: Data) -> [String: Any] {
        do {
            // use the JSONSerialization class to convert the data
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            return json
            
        } catch {
            print("Caught error while serializing data \(error)")
        }
        return ["error": "Failed to serialize data"]
    }
    
    // function to convert JSON object into Swift object using Codable and JSON decoder
    // Map the json data to our object
    func convertJSONDataToSwiftObject(data: Data) -> DogImage {
        let decoder = JSONDecoder()
        do {
            let imageData = try decoder.decode(DogImage.self, from: data)
            return imageData
            
        } catch {
            print("Caught error while decoding data \(error)")
        }
        return DogImage(status: "0", message: "failed")
    }


}

