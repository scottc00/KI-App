//
//  NewPostXIB.swift
//  KI Sales App
//
//  Created by Scott Callery on 11/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
import Photos

class NewPostXIB: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var image: UIImageView!
    var descriptionPlaceholderLbl = UILabel()
    var linkPlaceholderLbl = UILabel()
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionField.delegate = self
        setupView()
        setupImagePicker()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func setupView() {
       setPlaceholderText()
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            checkPermission()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            image.contentMode = .scaleAspectFill
            image.image = pickedImage
        }
        dismiss(animated: false, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postButton(_ sender: Any) {
        guard let title = titleField.text, title != "" else {
            print("SCOTT: Tittle must be entered")
            return
        }
        guard let description = descriptionField.text, description != "" else {
            print("Description must be entered")
            return
        }
        guard let category = categoryField.text, category != "" else {
            print("SCOTT: A category must be entered")
            return
        }
        guard let img = image.image else {
            print("SCOTT: An image must be selected")
            return
        }
        
        if let imgData = UIImageJPEGRepresentation(img, 0.2) {
            let imgUid = NSUUID().uuidString
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpeg"
            DataService.ds.REF_POST_IMAGES.child(imgUid).putData(imgData, metadata: metaData) { (metadata, error) in
                if error != nil {
                    print("SCOTT: Unable to upload image to Firebase storage")
                } else {
                    print("SCOTT: Successfull uploaded image to Firebase storage")
                    let downloadURL = metadata?.downloadURL()?.absoluteString
                }
            }
        }
    }
    
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            present(imagePicker, animated: true, completion: nil)
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    self.present(self.imagePicker, animated: true, completion: nil)
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }

    func setupImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

    }
    
    func setPlaceholderText() {
        let descriptionPlaceholderX: CGFloat = self.view.frame.size.width / 75
        let descriptionPlaceholderY: CGFloat = 0
        let descriptionPlaceholderWidth = descriptionField.bounds.width - descriptionPlaceholderX
        let descriptionPlaceholderHeight: CGFloat = 30
        let descriptionPlaceholderFontSize = self.view.frame.size.width / 25
        
        descriptionPlaceholderLbl.frame = CGRect(x: descriptionPlaceholderX + 5, y: descriptionPlaceholderY, width: descriptionPlaceholderWidth, height: descriptionPlaceholderHeight)
        descriptionPlaceholderLbl.text = "Description"
        descriptionPlaceholderLbl.font = UIFont(name: "AvenirNext", size: descriptionPlaceholderFontSize)
        descriptionPlaceholderLbl.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        descriptionPlaceholderLbl.textAlignment = NSTextAlignment.left
        descriptionField.addSubview(descriptionPlaceholderLbl)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if descriptionField.text.isEmpty {
            descriptionPlaceholderLbl.isHidden = false
        } else {
            descriptionPlaceholderLbl.isHidden = true
        }
    }
}
        

    
























