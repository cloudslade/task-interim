//
//  Task.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/18/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {
    convenience init(title: String, bodyText: String, timestamp: NSDate = NSDate(), context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
    }
}

// The objects are getting placed on the managed object context because this convenience init is doing that every time a new Taskobject is craeted. Once we have a Task/s on the MOC all we need to do is call the save function and all those objects will be saved to the persistence store through the persistent store coordinator.