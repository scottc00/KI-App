//
//  NewPostTextField.swift
//  KI Sales App
//
//  Created by Scott Callery on 11/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit

@IBDesignable class NewPostTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // Placeholder text indent
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    // Editing text indent
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0.8273660541, green: 0.8273660541, blue: 0.8273660541, alpha: 1)
        layer.cornerRadius = 6.0
        clipsToBounds = true
        
        // Placeholder colour
        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
    }
    
    
    
}
