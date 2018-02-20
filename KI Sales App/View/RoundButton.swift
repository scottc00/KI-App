//
//  RoundButton.swift
//  KI Sales App
//
//  Created by Scott Callery on 05/01/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        layer.cornerRadius = frame.height / 2
        //   layer.borderWidth = 2
        //  layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}
