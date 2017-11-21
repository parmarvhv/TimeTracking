//
//  StyledNavigationItem.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 21/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class StyledNavigationItem: UINavigationItem {
    
    @IBInspectable var backButtonTitle: String? = nil {
        didSet {
            self.updateBackButtonTitle()
        }
    }
    
    override var title: String? {
        didSet {
            self.updateTitle()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.updateTitle()
        
        self.updateBackButtonTitle()
        
        if let item = self.leftBarButtonItem { self.configureFontsForBarButtonItem(item) }
        if let item = self.rightBarButtonItem { self.configureFontsForBarButtonItem(item) }
    }
        
    fileprivate func configureFontsForBarButtonItem(_ item: UIBarButtonItem) {
        item.setTitleTextAttributes([
            NSFontAttributeName: UIFont.init(name: "Avenir Next", size: 15)!,
            NSForegroundColorAttributeName: UIColor.white
            ], for: .normal)
    }
    
    fileprivate func updateTitle() {
        if let title = self.title {
            self.attributedTitle = NSAttributedString(string: title, attributes: [
                NSFontAttributeName: UIFont.init(name: "Avenir Next", size: 20)!,
                NSForegroundColorAttributeName: UIColor.white
                ])
        } else {
            self.attributedTitle = nil
        }
    }
    
    fileprivate func updateBackButtonTitle() {
        self.backBarButtonItem = UIBarButtonItem(title: self.backButtonTitle ?? "", style: .plain, target: nil, action: nil)
    }
    
}

private let kAttributedTitleLabelTag = 325

extension UINavigationItem {
    
    public var attributedTitle: NSAttributedString? {
        get {
            return  self.labelForAttributedTitle()?.attributedText
        }
        set(attributedTitle){
            let label: UILabel
            if let currentLabel = self.labelForAttributedTitle() {
                label = currentLabel
            } else {
                label = UILabel()
                label.tag = kAttributedTitleLabelTag
                self.titleView = label
            }
            
            label.attributedText = attributedTitle
            label.textAlignment = .center
            label.sizeToFit()
        }
    }
    
    fileprivate func labelForAttributedTitle() -> UILabel? {
        var label : UILabel? = nil
        if let currentLabel = self.titleView as? UILabel , currentLabel.tag == kAttributedTitleLabelTag {
            label = currentLabel
        }
        return label
    }
    
}

