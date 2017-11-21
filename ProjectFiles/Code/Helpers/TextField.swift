//
//  TextField.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 21/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

@IBDesignable
class TextField: UITextField {
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateImage()
        }
    }
    
    @IBInspectable var suffix: String? {
        didSet {
            updateSuffix()
        }
    }
    
    
    fileprivate func updateImage() {
        if let image = rightImage {
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 8))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            rightView = imageView
            
        } else {
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }
    }
    
    fileprivate func updateSuffix() {
        if let text = suffix {
            rightViewMode = UITextFieldViewMode.always
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
            label.font = UIFont.init(name: "Avenir Next", size: 18.0)
            label.text = text
            rightView = label
        }
    }
}
