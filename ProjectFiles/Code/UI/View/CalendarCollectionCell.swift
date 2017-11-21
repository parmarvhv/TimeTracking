//
//  CalendarCollectionCell.swift
//  TimeTracking
//
//  Created by Vaibhav Parmar on 18/11/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class CalendarCollectionCell: UICollectionViewCell {
    static let identifer = "CalendarCollectionCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.decorateView()
    }
    
    override var isSelected: Bool {
        didSet {
            self.backView.backgroundColor = isSelected ? .gray : .white
            self.dateLabel.textColor = isSelected ? .white : .black
        }
    }
    
    func configure(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let day = Calendar.current.component(.day, from: date)
        let month = dateFormatter.string(from: date)

        let isToday = Calendar.current.isDateInToday(date)
        self.dateLabel.text = isToday ? "Today" : "\(day) \(month)"
    }
    
    
    fileprivate func decorateView() {
        self.backView.layer.cornerRadius = 10.0
    }
}
