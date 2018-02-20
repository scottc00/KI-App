//
//  NewsFeedCell.swift
//  KI Sales App
//
//  Created by Scott Callery on 18/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var numberOfViewsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
