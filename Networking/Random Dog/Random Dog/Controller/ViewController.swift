//
//  ViewController.swift
//  Random Dog
//
//  Created by Majd on 2019-02-16.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var breedPicker: UIPickerView!
    
    var breeds: [String] = ["poodle", "greyhound"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        breedPicker.delegate = self
        breedPicker.dataSource = self
        
        DogAPI().requestAllBreeds(completionHandler: handleRequestAllBreeds(breedsList:error:))
    }
    
    // handler function to assign the breeds list to "breeds" class array
    func handleRequestAllBreeds(breedsList: [String]?,error: Error?) {
        guard let breedsList = breedsList else {
            print("Failed to get breeds list")
            return
        }
        self.breeds = breedsList
        DispatchQueue.main.async {
            self.breedPicker.reloadAllComponents()
        }
    }
    // functions to conform to UIPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DogAPI.requestRandomImage(breed: breeds[row], completionHandler: handleRandomImageRequest(imageData:error:))
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

