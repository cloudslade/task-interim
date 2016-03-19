//
//  TaskTableViewCell.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/17/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet var taskNameLabel: UILabel!
    @IBOutlet var taskDueDateLabel: UILabel!
    @IBOutlet var completeButton: UIButton!
    
    func updateWithTask(task: Task) {
        self.taskNameLabel.text = task.title
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let formattedDate = formatter.stringFromDate(task.timestamp!)
        self.taskDueDateLabel.text = formattedDate
//        if task.complete {
//            self.completeButton.setImage(UIImage(named: "complete"), forState: UIControlState.Normal)
//        } else {
//            self.completeButton.setImage(UIImage(named: "incomplete"), forState: UIControlState.Normal)
//        }
    }
}