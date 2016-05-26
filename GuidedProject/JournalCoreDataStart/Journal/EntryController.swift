//
//  EntryController.swift
//  Journal
//
//  Created by Nathan on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    static let sharedController = EntryController()
    
    let fetchedResultsController: NSFetchedResultsController
    
    init() {
        let request = NSFetchRequest(entityName: "Entry")
        let happySortDescriptor = NSSortDescriptor(key: "happy", ascending: false)
        let timestampSortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        request.sortDescriptors = [happySortDescriptor, timestampSortDescriptor]
        
         self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "happy", cacheName: nil)
        _ = try? fetchedResultsController.performFetch()
    }
    
    func addEntry(title: String, text: String, isHappy: Bool) {
        _ = Entry(title: title, text: text, isHappy: isHappy)
        saveToPersistentStorage()
    }
    
    func updateEntry(entry: Entry, title: String, text: String, isHappy: Bool) {
        entry.title = title
        entry.text = text
        entry.happy = isHappy
        saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        
        entry.managedObjectContext?.deleteObject(entry)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
}