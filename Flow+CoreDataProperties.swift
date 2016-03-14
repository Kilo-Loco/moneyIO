//
//  Flow+CoreDataProperties.swift
//  Money IO
//
//  Created by Kyle Lee on 3/13/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Flow {

    @NSManaged var date: NSDate?
    @NSManaged var cashFlow: NSNumber?
    @NSManaged var balance: NSNumber?
    @NSManaged var posNum: NSNumber?

}
