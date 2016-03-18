//
//  TaskController.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/17/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import Foundation

class TaskController {
    private let kTasks = "taskKey"
    static let sharedTaskController = TaskController()
    var tasks: [Task] = []
    
    func createTask(task: Task) {
        // append the task to the array.
        tasks.append(task)
        saveToPersistentStorage()
    }
    
    func deleteTask(task: Task) {
        // Here we need equatable to find our task.
        for (index, element) in tasks.enumerate() {
            if task == element {
                tasks.removeAtIndex(index)
            }
        }
        saveToPersistentStorage()
    }
    
    func updateTask(task: Task, withTask: Task) {
        for element in tasks {
            if element == task {
                element.taskName = withTask.taskName
                element.taskDueDate = withTask.taskDueDate
                element.taskNotes = withTask.taskNotes
                element.complete = withTask.complete
            }
        }
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        NSKeyedArchiver.archiveRootObject(self.tasks, toFile: self.filePath(kTasks))
    }
    
    func loadFromPersistentStorage() {
        let unarchivedTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath(kTasks))
        if let unarchivedTasks = unarchivedTasks as? [Task] {
            self.tasks = unarchivedTasks
        }
        
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        return entriesPath
    }
    
}

func ==(lhs: Task, rhs: Task) -> Bool {
    return lhs.taskName == rhs.taskName && lhs.taskDueDate == rhs.taskDueDate && lhs.complete == rhs.complete && lhs.taskNotes == rhs.taskNotes
}

// Implement NSCoding followed my Code Data.