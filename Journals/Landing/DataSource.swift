//
//  DataSource.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class DataSource: NSObject, UITableViewDataSource {

    let tableView: UITableView

    let context: NSManagedObjectContext

    lazy var fetchedResultsController: FetchResultController = {

        return FetchResultController(managedObjectContext: self.context, tableView: self.tableView)

    }()

    init(tableView: UITableView, context: NSManagedObjectContext) {

        self.tableView = tableView

        self.context = context
    }

    func object(at indexPath: IndexPath) -> Journal {

        return fetchedResultsController.object(at: indexPath)
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {

        return fetchedResultsController.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let section = fetchedResultsController.sections?[section] else { return 0 }

        return section.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JournalTableViewCell", for: indexPath) as? JournalTableViewCell else {
            return UITableViewCell()
        }

        let journal = fetchedResultsController.object(at: indexPath)

        cell.titleLabel.text = journal.title

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        let journal = fetchedResultsController.object(at: indexPath)

        context.delete(journal)

        context.saveChanges()

    }
}
