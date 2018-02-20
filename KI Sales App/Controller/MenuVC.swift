//
//  MenuVC.swift
//  KI Sales App
//
//  Created by Scott Callery on 09/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import Firebase

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 100
        
    }

    @IBAction func signOutBtnPressed(_ sender: Any) {
        signOut()
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("SCOTT: Error signing out", signOutError)
        }
        
    }
}
