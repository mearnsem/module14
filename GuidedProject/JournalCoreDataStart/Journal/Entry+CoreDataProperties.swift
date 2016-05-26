//
//  Entry+CoreDataProperties.swift
//  Journal
//
//  Created by Nathan on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entry {

    @NSManaged var happy: NSNumber
    @NSManaged var text: String
    @NSManaged var timestamp: NSDate
    @NSManaged var title: String

}
