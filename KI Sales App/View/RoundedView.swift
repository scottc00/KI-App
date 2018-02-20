//
//  RoundedView.swift
//  KI Sales App
//
//  Created by Scott Callery on 06/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit

@IBDesignable class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = 15
    }

}
