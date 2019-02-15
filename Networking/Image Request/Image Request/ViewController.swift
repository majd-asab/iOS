//
//  ViewController.swift
//  Image Request
//
//  Created by Majd on 2019-02-13.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

enum ImageURLs: String {
    case http = "http://developer.apple.com/swift/images/swift-og.png"
    case https = "https://developer.apple.com/swift/images/swift-og.png"
    case none = "not a url"
}

class ViewController: UIViewController {

    let imageLocation = ImageURLs.http.rawValue
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func requestButton(_ sender: UIButton) {
        guard let imageUrl = URL(string: self.imageLocation) else { // convert string to URL
            print("cannot create URL from string")
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageUrl) {(data, response, error) in
            // check if data came back
            guard let data = data else {
                print("didn't get data back")
                return
            }
            // convert data to UIImage
            let downloadableImage = UIImage(data: data)
            
            // disptach call to update from main thread
            DispatchQueue.main.async {
                self.imageView.image = downloadableImage
            }
        }
        // run the task
        task.resume()
    }
    
    @IBAction func openFromFileButton(_ sender: Any) {
        guard let imageUrl = URL(string: self.imageLocation) else {
            print("cannot create URL from string")
            return
        }
        
        let task = URLSession.shared.downloadTask(with: imageUrl) {(location, response, error) in
            guard let location = location else {
                print("location not retrievable")
                return
            }
            
            do {
                // get data from file
                let imageData = try Data(contentsOf: location)
                
                // load data in UIImage
                let image = UIImage(data: imageData)
                
                // update storyboard
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            } catch {
                print("error loading image from file: \(error)")
            }
        }
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

