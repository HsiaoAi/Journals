//
//  CoreDataStack.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import Foundation

import CoreData

class CoreDataStack {

    lazy var managedObjectContext: NSManagedObjectContext = {

        let container = self.persistentContainer

        return container.viewContext

    }()

    private lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Journal")

        container.loadPersistentStores { _, error in

            if let error = error as NSError? {

                fatalError("Unresolved error: \(error), \(error.userInfo)")

            }
        }

        return container

    }()
}

extension NSManagedObjectContext {

    func saveChanges() {

        if self.hasChanges {

            do {

                try save()

            } catch {

                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
