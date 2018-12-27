//
//  ViewController.swift
//  Image Picker App
//
//  Created by Majd on 2018-12-21.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth: 1.0
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.defaultTextAttributes = self.memeTextAttributes
        // set the UITextField capitalization to allCharacters
        self.textField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // check if camera is available
        let cameraAvailability = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        // disable camera button if it's not avaiable
        if !cameraAvailability {
            self.cameraButtonItem.isEnabled = false
        }
        
    }


    // MARK: Pick image from album
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    // MARK: Pick image from camera
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .camera
        self.present(controller, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.imagePickerView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}

