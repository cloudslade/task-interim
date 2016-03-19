//
//  TaskDetailController.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/17/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import UIKit

class TaskDetailViewController: UITableViewController {
    @IBOutlet var dueDatePicker: UIDatePicker!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var dueDateTextField: UITextField!
    var task: Task?
    
    override func viewDidLoad() {
        self.dueDateTextField.inputView = dueDatePicker
        updateWithTask()
        nameTextField.becomeFirstResponder()
    }
    
    func updateWithTask() {
        if let task = self.task {
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.FullStyle
            let formattedDate = formatter.stringFromDate((task.timestamp!))
            self.dueDateTextField.text = formattedDate
            self.nameTextField.text = task.title
            self.notesTextView.text = task.bodyText
        }
    }
    
    @IBAction func datePicked(sender: UIDatePicker) {
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.FullStyle
        let dateValue = sender.date
        self.dueDateTextField.text = formatter.stringFromDate(dateValue)
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if dueDateTextField.text == "" || dueDateTextField.text == nil {
            let alertController = UIAlertController(title: "Warning", message: "Please select a due date before saving your date.", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(ok)
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        let title = nameTextField.text ?? ""
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.FullStyle
        let date = formatter.dateFromString(dueDateTextField.text!)
        let dueDate = date!
        let notes = notesTextView.text
        let task = Task(title: title, bodyText: notes, timestamp: dueDate)
        if let dataSourceTask = self.task {
            for element in TaskController.sharedTaskController.tasks {
                if dataSourceTask == element {
                    TaskController.sharedTaskController.updateTask(element, withTask: task)
                }
            }
        } else {
            TaskController.sharedTaskController.saveToPersistentStorage()
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
}