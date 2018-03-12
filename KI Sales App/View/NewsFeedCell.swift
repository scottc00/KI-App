//
//  NewsFeedCell.swift
//  KI Sales App
//
//  Created by Scott Callery on 18/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import Firebase

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var numberOfViewsLbl: UILabel!
    @IBOutlet weak var postDate: UILabel!
    
    var newsFeedVC = NewsFeedVC()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(post: Post, img: UIImage? = nil) {
        self.titleLbl.text = post.title
        self.descriptionText.text = post.description
        self.numberOfViewsLbl.text = "\(post.views)"
        self.postDate.text = "\(convertTimeStamp(serverTimestamp: Double(post.postedDate)))"
        
        
        if img != nil {
            self.postImage.image = img
        } else {
                let ref = Storage.storage().reference(forURL: post.imageUrl)
            ref.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("SCOTT: UNABLE TO DOWNLOAD IMAGE FROM FIREBASE STORAGE")
                } else {
                    print("SCOTT: IMAGE DOWNLOADED FROM FIREBASE STORAGE")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.postImage.image = img
                            NewsFeedVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                        }
                    }
                }
            })
        }
        
//        let fullNameRef = DataService.ds.REF_USER_CURRENT.child("fullname")
//        fullNameRef.observeSingleEvent(of: .value) { (snapshot) in
//            if let _ = snapshot.value as? NSNull {
//                self.authorLbl.text = "N/A"
//            } else {
//                self.authorLbl.text = "\(snapshot.value!)"
//            }
//        }
        
    }
    
    func convertTimeStamp(serverTimestamp: Double) -> String {
        let x = serverTimestamp / 1000
        let date = Date(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm  dd/MM/yy"
        
        return formatter.string(from: date as Date)
    }
}
