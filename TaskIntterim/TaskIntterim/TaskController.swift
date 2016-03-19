//
//  TaskController.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/17/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    static let sharedTaskController = TaskController()
    var tasks: [Task] {
        let moc = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Task")
        do {
            return try moc.executeFetchRequest(request) as! [Task]
        } catch {
            print("could not retrieve the array of Tasks")
            return []
        }
    }
    
    func createTask(task: Task) {
        saveToPersistentStorage()
    }
    
    func deleteTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
            self.saveToPersistentStorage()
        }
    }
    
    func updateTask(task: Task, withTask: Task) {
        for element in tasks {
            if element == task {
                element.title = withTask.title
                element.timestamp = withTask.timestamp
                element.bodyText = withTask.bodyText
            }
        }
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("could not save")
        }
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        return entriesPath
    }
    
}

//func ==(lhs: Task, rhs: Task) -> Bool {
//    return lhs.title == rhs.title && lhs.timestamp == rhs.timestamp && lhs.bodyText == rhs.bodyText
//}

// Implement NSCoding followed my Code Data.