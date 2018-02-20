//
//  RoundField.swift
//  KI Sales App
//
//  Created by Scott Callery on 05/01/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit

@IBDesignable class RoundField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    // Placeholder text indent
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 5)
    }
    
    // Editing text indent
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 5)
    }
    
    func setupView() {
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        clipsToBounds = true
    
        // Placeholder colour
        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
    }
}
