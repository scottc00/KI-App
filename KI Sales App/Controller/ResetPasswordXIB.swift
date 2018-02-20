//
//  ResetPasswordVC.swift
//  KI Sales App
//
//  Created by Scott Callery on 06/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordXIB: UIViewController {

    @IBOutlet weak var emailField: RoundField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func resetPwdBtnPressed(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: emailField.text!) { (error) in
            if error != nil {
                print(error?.localizedDescription)
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .userNotFound:
                        self.errorLabel.isHidden = false
                    default:
                        self.errorLabel.isHidden = true
                    }
                }
            } else {
                self.errorLabel.isHidden = true
                self.dismiss(animated: false, completion: nil)
                print("SCOTT: Password reset email sent")
            }
        }
        
    }
    

   

}
