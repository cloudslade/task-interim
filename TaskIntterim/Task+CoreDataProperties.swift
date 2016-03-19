//
//  Task+CoreDataProperties.swift
//  TaskIntterim
//
//  Created by Dylan Slade on 3/18/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var title: String?
    @NSManaged var timestamp: NSDate?
    @NSManaged var bodyText: String?

}
