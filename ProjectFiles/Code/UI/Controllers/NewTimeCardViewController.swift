//
//  NewTimeCardViewController.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 21/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class NewTimeCardViewController: UIViewController {

    @IBOutlet var projectField: TextField!
    @IBOutlet var taskField: TextField!
    @IBOutlet var durationField: TextField!
    
    var projectPicker = UIPickerView()
    var taskPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupProjectPicker()
        self.setupTaskPicker()
        self.setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateNavigationBarAppearance()
    }
    
    fileprivate func updateNavigationBarAppearance() {
        self.title = "New Timecard Entry"
    }
    
    static var newInstance : NewTimeCardViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "NewTimeCardViewController") as! NewTimeCardViewController
        return vc
    }
}

//MARK: UIPickerViewDelegate UIPickerViewDataSource
extension NewTimeCardViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    fileprivate func setupProjectPicker() {
        self.projectPicker.delegate = self
        self.projectPicker.dataSource = self
        self.projectField.inputView = projectPicker
    }
    
    fileprivate func setupTaskPicker() {
        self.taskPicker.delegate = self
        self.taskPicker.dataSource = self
        self.taskField.inputView = taskPicker
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

extension NewTimeCardViewController {
    fileprivate func setupGestures() {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeGesture(_:)))
        swipeGestureRecognizer.direction = .down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @objc fileprivate func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        projectField.resignFirstResponder()
        taskField.resignFirstResponder()
    }
}
