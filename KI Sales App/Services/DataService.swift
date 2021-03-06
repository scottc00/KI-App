//
//  DataService.swift
//  KI Sales App
//
//  Created by Scott Callery on 09/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import Firebase

let DB_BASE = Database.database().reference()

class DataService: UIViewController {

    static let ds = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
