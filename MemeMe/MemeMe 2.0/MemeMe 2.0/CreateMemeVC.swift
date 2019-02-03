//
//  CreateMemeVC.swift
//  MemeMe 2.0
//
//  Created by Majd on 2019-01-30.
//  Copyright © 2019 HappyWorld. All rights reserved.
//

import UIKit

class CreateMemeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: CustomTextField!
    @IBOutlet weak var bottomTextField: CustomTextField!
    @IBOutlet weak var cameraButtonItem: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var topNavBar: UINavigationBar!
    
    
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

        // set top bar items
        self.topNavBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMeme))
        self.topNavBar.topItem?.title = "Create & Share"
        self.topNavBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissVC))
        
        // by default share is disable until user setDefaultText() is invoked as a result of user choosing an image
        shareButton(isEnabled: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: enable or disable share button in nav bar
    func shareButton(isEnabled: Bool) {
        if let leftButton = self.topNavBar.topItem?.leftBarButtonItem {
            leftButton.isEnabled = isEnabled
        }
    }
    
    // MARK: subscribe to notification center and listen to keyboard will show
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: unsubscribe to notification center and listening to keyboard
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        // check and only shift the view if its the bottom textfield
        if self.bottomTextField.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        if self.bottomTextField.isFirstResponder {
            view.frame.origin.y = 0.0
        }
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
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
            self.shareButton(isEnabled: true)
        }
        // use the picker's dismisser to avoid dismissing the VC of the MEME creator
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: function to generat image from view hierarchy
    func generatedMemeView() -> UIImage {
        // hiding subviews
        self.toolbar.isHidden   = true
        self.topNavBar.isHidden = true
        
        //render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
//        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        view.drawHierarchy(in: self.imageView.frame, afterScreenUpdates: true)

        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // show subviews
        self.topNavBar.isHidden = false
        self.toolbar.isHidden   = false
        
        return memedImage
    }
    
    // MARK: save the memed image
    func save() -> Meme {
        let meme: Meme = Meme(topText: self.topTextField.text!, bottomText: self.bottomTextField.text!, originalImage: self.imageView.image!, memedImage: generatedMemeView())
        
        // add the meme to the array in app delegate file
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
        // return meme
        return meme
    }
    
    // MARK: function to share meme
    @IBAction func shareMeme() {
        
        let meme = self.save()
        
        let activityController = UIActivityViewController(activityItems: [meme.memedImage], applicationActivities: nil)
        
        // you can add a close to be executed once the user is done with the UIActivity controller
        activityController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, activityError: Error?) in
            if !completed {
                print("user dismissed activity controller")
                return
            }
        }
        self.present(activityController, animated: true, completion: nil)
    }
    
    // MARK: dismiss modal VC
    @IBAction func dismissVC(){
        self.dismiss(animated: true)
    }
}

