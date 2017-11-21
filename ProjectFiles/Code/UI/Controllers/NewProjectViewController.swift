//
//  NewProjectViewController.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 21/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class NewProjectViewController: UIViewController {

    @IBOutlet var clientField: TextField!
    @IBOutlet var projectField: TextField!
    @IBOutlet var budgetField: UITextField!
    
    var clientPicker = UIPickerView()
    var projectPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupClientPicker()
        self.setupProjectPicker()
        self.setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateNavigationBarAppearance()
    }
    
    fileprivate func updateNavigationBarAppearance() {
        self.title = "New Project Entry"
    }
}

//MARK: UIPickerViewDelegate UIPickerViewDataSource
extension NewProjectViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    fileprivate func setupClientPicker() {
        self.clientPicker.dataSource = self
        self.clientPicker.delegate = self
        self.clientField.inputView = clientPicker
    }
    
    fileprivate func setupProjectPicker() {
        self.projectPicker.dataSource = self
        self.projectPicker.delegate = self
        self.projectField.inputView = projectPicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Title"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // implementation
    }
}

extension NewProjectViewController {
    fileprivate func setupGestures() {
    let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeGesture(_:)))
    swipeGestureRecognizer.direction = .down
    self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @objc fileprivate func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
    projectField.resignFirstResponder()
    clientField.resignFirstResponder()
    }
}
