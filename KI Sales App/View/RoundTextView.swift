//
//  RoundTextView.swift
//  KI Sales App
//
//  Created by Scott Callery on 11/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit

@IBDesignable class RoundTextView: UITextView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

    func setupView() {
        // Setup border
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0.8273660541, green: 0.8273660541, blue: 0.8273660541, alpha: 1)
        layer.cornerRadius = 6.0
        clipsToBounds = true
        
        textContainerInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        
    
                
    }

}
