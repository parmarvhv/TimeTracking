//
//  ProjectsViewController.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 21/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateNavigationBarAppearance()
    }
    
    fileprivate func updateNavigationBarAppearance() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .gray
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        self.title = "Projects"
    }
}
