//
//  Post.swift
//  KI Sales App
//
//  Created by Scott Callery on 20/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import Foundation

class Post {
    private var _title: String!
    private var _description: String!
    private var _imageUrl: String!
    private var _views: Int!
    private var _postId: String!
    private var _postedDate : Int!
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var views: Int {
        return _views
    }
    
    var postId: String {
        return _postId
    }
    
    var postedDate: Int {
        return _postedDate
    }
    
    init(title: String, imageUrl: String, description: String, views: Int, postedDate: Int) {
        self._title = title
        self._imageUrl = imageUrl
        self._views = views
        self._postedDate = postedDate
    }
    
    init(postId: String, postData: Dictionary<String, AnyObject>) {
        self._postId = postId
        
        if let title = postData["title"] as? String {
            self._title = title
        }
        
        if let description = postData["description"] as? String {
            self._description = description
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let views = postData["views"] as? Int {
            self._views = views
        }
        
        if let postedDate = postData["postedDate"] as? Int {
            self._postedDate = postedDate
        }
    }
}
