//
//  TimeCardViewController.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 18/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class TimeCardViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewTrailingConstraint: NSLayoutConstraint!
    
    var dates: [Date] = []
    var calender = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.prepareCalenderData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // select first item of collectionView
        self.selectFirstItem()
    }
    
    fileprivate func prepareCalenderData() {
        fillPreviousDates()
        self.collectionView.reloadData()
    }
}

extension TimeCardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    fileprivate func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionViewTrailingConstraint.constant = self.view.bounds.width / 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarCollectionCell.identifer,
            for: indexPath) as! CalendarCollectionCell
        cell.configure(date: dates[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarCollectionCell.identifer,
            for: indexPath) as! CalendarCollectionCell
        cell.isSelected = true
    }
    
    fileprivate func selectFirstItem() {
        let indexPath = IndexPath(item: 0, section: 0)
        self.collectionView.selectItem(
            at: indexPath,
            animated: true,
            scrollPosition: .centeredHorizontally)
    }
    
}

extension TimeCardViewController {
    fileprivate func fillPreviousDates() {
        let toDate = Date().addingTimeInterval(60 * 60 * 24 * -31)
        //let fromDate = Date().addingTimeInterval(60 * 60 * 24 * 10)
        var days = DateComponents()
        
        var dayCount = 0
        repeat {
            days.day = dayCount
            dayCount -= 1
            guard let date = calender.date(byAdding: days, to: Date()) else {
                break
            }
            if date.compare(toDate) == .orderedAscending { break }
            self.dates.append(date)
        } while(true)
    }
}

