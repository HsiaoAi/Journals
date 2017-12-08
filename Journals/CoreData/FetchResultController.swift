//
//  FetchResultController.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit
import CoreData

class FetchResultController: NSFetchedResultsController<Journal>, NSFetchedResultsControllerDelegate {

    let tableView: UITableView

    init(managedObjectContext: NSManagedObjectContext, tableView: UITableView) {

        self.tableView = tableView

        super.init(fetchRequest: Journal.fetchRequest(),

                   managedObjectContext: managedObjectContext,

                   sectionNameKeyPath: nil,

                   cacheName: nil)

        self.delegate = self

        tryFetch()
    }

    func tryFetch() {

        do {

            try performFetch()

        } catch {

            print("Unresolved error: \(error.localizedDescription)")

        }
    }

    // MARK: - Fetched Results Controller Delegate

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {

        tableView.beginUpdates()

    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

        switch type {

        case .insert:

            guard let newIndexPath = newIndexPath else { return }

            tableView.insertRows(at: [newIndexPath], with: .automatic)

        case .delete:

            guard let indexPath = indexPath else { return }

            tableView.deleteRows(at: [indexPath], with: .automatic)

        case .update, .move:

            guard let indexPath = indexPath else { return }

            tableView.reloadRows(at: [indexPath], with: .automatic)

        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
