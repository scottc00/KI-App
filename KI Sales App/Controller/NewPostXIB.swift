//
//  NewPostXIB.swift
//  KI Sales App
//
//  Created by Scott Callery on 11/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import Photos
import AVFoundation

class NewPostXIB: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var linkField: UITextView!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var image: UIImageView!
    var descriptionPlaceholderLbl = UILabel()
    var linkPlaceholderLbl = UILabel()
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerSetup()
        descriptionField.delegate = self
        linkField.delegate = self
        setupView()
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
        checkPermission()
        
        
//            let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
//
//            if authStatus == AVAuthorizationStatus.authorized {
//                print("SCOTT: AUTHORIZED")
//            }
//            if authStatus == AVAuthorizationStatus.notDetermined {
//                    print("SCOTT: NOT SET")
//                }
//            if authStatus == AVAuthorizationStatus.denied {
//                    print("SCOTT: AUTH DENIED")
//            }
//        }
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
    }
    
    func imagePickerSetup() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
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
    
    func setPlaceholderText() {
        let linkPlaceholderX: CGFloat = self.view.frame.size.width / 75
        let linkPlaceholderY: CGFloat = 0
        let linkPlaceholderWidth = linkField.bounds.width - linkPlaceholderX
        let linkPlaceholderHeight: CGFloat = 30
        let linkPlaceholderFontSize = self.view.frame.size.width / 25
        
        linkPlaceholderLbl.frame = CGRect(x: linkPlaceholderX + 5, y: linkPlaceholderY, width: linkPlaceholderWidth, height: linkPlaceholderHeight)
        linkPlaceholderLbl.text = "Link"
        linkPlaceholderLbl.font = UIFont(name: "AvenirNext", size: linkPlaceholderFontSize)
        linkPlaceholderLbl.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        linkPlaceholderLbl.textAlignment = NSTextAlignment.left
        linkField.addSubview(linkPlaceholderLbl)
        
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
        if linkField.text.isEmpty {
            linkPlaceholderLbl.isHidden = false
        } else {
            linkPlaceholderLbl.isHidden = true
        }
    }
}
        

    
























