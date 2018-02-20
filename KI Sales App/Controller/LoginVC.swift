//
//  LoginVC.swift
//  KI Sales App
//
//  Created by Scott Callery on 05/01/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailField: RoundField!
    @IBOutlet weak var passwordField: RoundField!
    
    @IBOutlet weak var loginError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.delegate = self
        loginError.isHidden = true
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                print("SCOTT: USER IS ALREADY LOGGED IN")
                UIView.setAnimationsEnabled(false)
                self.performSegue(withIdentifier: "toSWRevealController", sender: nil)
                UIView.setAnimationsEnabled(true)
                self.emailField.text = ""
                self.passwordField.text = ""
            }
        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        passwordField.resignFirstResponder()
     
        guard let email = emailField.text, emailField.text != "" else { return }
        guard let password = passwordField.text, passwordField.text != "" else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .wrongPassword:
                        self.wrongPasswordAnimation()
                        self.loginError.text = "Incorrect username or password"
                        self.loginError.isHidden = false
                    case .invalidEmail:
                        self.wrongPasswordAnimation()
                        self.loginError.text = "Incorrect username or password"
                        self.loginError.isHidden = false
                    case .userDisabled:
                        self.loginError.text = "User disabled"
                        self.loginError.isHidden = false
                    case .userNotFound:
                        self.loginError.text = "User not found"
                        self.loginError.isHidden = false
                    default:
                        self.loginError.isHidden = true
                    }
                }
                print(error?.localizedDescription)
            } else {
            // Reset login error label
                self.loginError.isHidden = true
                self.loginError.text = "Incorrect username or password"
                
            // User successfully logged in
                print("SCOTT: User logged in")
                self.performSegue(withIdentifier: "toSWRevealController", sender: nil)
            }
        }
   }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        let resetPasswordXIB = ResetPasswordXIB()
        resetPasswordXIB.modalPresentationStyle = .custom
        present(resetPasswordXIB, animated: false, completion: nil)
        
    }
    
    func wrongPasswordAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.passwordField.center.x += 10 }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.passwordField.center.x -= 20 }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.passwordField.center.x += 10 }, completion: nil)
        
    }
}



