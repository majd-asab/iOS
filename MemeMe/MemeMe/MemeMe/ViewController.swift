//
//  ViewController.swift
//  MemeMe
//
//  Created by Majd on 2018-12-27.
//  Copyright © 2018 HappyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: CustomTextField!
    @IBOutlet weak var bottomTextField: CustomTextField!
    @IBOutlet weak var cameraButtonItem: UIBarButtonItem!
    
    
    // MARK: Delegate class instances
    
    let shareableTextFieldDelegate = ImageTextFieldDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a
        
        // set delegates for behavior
        self.topTextField.delegate    = shareableTextFieldDelegate
        self.bottomTextField.delegate = shareableTextFieldDelegate
        
        // disable camera button if not available
        let cameraAvailable = UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        if cameraAvailable == false {
            self.cameraButtonItem.isEnabled = false
        }
        
    }
    
    // MARK: function to set default text for textfields
    func setDefaultText() {
        self.topTextField.text = "TOP TEXT"
        self.bottomTextField.text = "BOTTOM TEXT"
    }
    
    // MARK: function to pick image from album
    
    @IBAction func pickImageFromAlbum() {
        let controller = UIImagePickerController()
        controller.sourceType = UIImagePickerController.SourceType.photoLibrary
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    // MARK: function to pick image from camera
    
    @IBAction func pickImageFromCamera() {
        let controller = UIImagePickerController()
        controller.sourceType = UIImagePickerController.SourceType.camera
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    // MARK: delegate function to cancel picking image
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: delegate function to choose original image
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
            self.setDefaultText()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    


}

