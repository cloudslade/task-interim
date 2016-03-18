//
//  Task.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/17/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    var taskName: String
    var taskDueDate: NSDate
    var taskNotes: String
    var complete: Bool
    
    init(taskName: String, taskDueDate: NSDate, taskNotes: String, complete: Bool) {
        self.taskName = taskName
        self.taskDueDate = taskDueDate
        self.taskNotes = taskNotes
        self.complete = complete
    }
    
    // NSCoding
    
    @objc required init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObjectForKey("nameKey") as? String,
            taskNotes = aDecoder.decodeObjectForKey("notesKey") as? String,
            taskDueDate = aDecoder.decodeObjectForKey("dueDateKey") as? NSDate else {
                self.taskName = ""
                self.taskNotes = ""
                self.complete = false
                self.taskDueDate = NSDate()
                super.init()
                return nil
        }
        self.taskName = name
        self.taskNotes = taskNotes
        self.taskDueDate = taskDueDate
        self.complete = aDecoder.decodeBoolForKey("completeKey")
        super.init()
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.taskName, forKey: "nameKey")
        aCoder.encodeObject(self.taskNotes, forKey: "notesKey")
        aCoder.encodeObject(self.taskDueDate, forKey: "dueDateKey")
        aCoder.encodeBool(self.complete, forKey: "completeKey")
    }
}





