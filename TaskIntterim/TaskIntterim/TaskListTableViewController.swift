//
//  TaskListTableViewController.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/17/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    override func viewDidLoad() {
        TaskController.sharedTaskController.loadFromPersistentStorage()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedTaskController.tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! TaskTableViewCell
        let task = TaskController.sharedTaskController.tasks[indexPath.row]
        cell.updateWithTask(task)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTaskDetail" {
            let dvc = segue.destinationViewController as! TaskDetailViewController
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPathForCell(cell)
            let task = TaskController.sharedTaskController.tasks[(indexPath?.row)!]
            dvc.task = task
        }
    }
    
}