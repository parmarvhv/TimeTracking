//
//  StyledNavigationBar.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 21/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class StyledNavigationBar: UINavigationBar {
    override func awakeFromNib() {
        super.awakeFromNib()

        self.isTranslucent = false
        self.tintColor = .white
        self.barTintColor = .gray
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.titleTextAttributes = titleTextAttributes
    }
}

