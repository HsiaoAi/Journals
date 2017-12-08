//
//  ViewController.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit
import CoreData

class LandingTableViewController: UITableViewController {

    // CoreData properties

    let managedObjectContext = CoreDataStack().managedObjectContext

    lazy var dataSource: DataSource = {

        return DataSource(tableView: self.tableView, context: self.managedObjectContext)

    }()

    // UI properties
    lazy var navigationTitleLabel: UILabel = {

        let label = UILabel()

        label.text = "My Journals"

        label.textAlignment = .center

        label.textColor = UIColor.Custom.slate

        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)

        label.translatesAutoresizingMaskIntoConstraints = false

        return label

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = dataSource

        setupNavigationBar()

        setupTableView()

    }
}

// MARK: UITableViewDelegate

extension LandingTableViewController {

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }

}

// Setup UI functions
extension LandingTableViewController {

    func setupTableView() {

        let nib = UINib(
            nibName: "JournalTableViewCell",
            bundle: nil
        )

        self.tableView.register(
            nib,
            forCellReuseIdentifier: "JournalTableViewCell"
        )

        self.tableView.backgroundColor = UIColor.white

        self.tableView.alwaysBounceVertical = false

        self.tableView.separatorStyle = .none

        self.tableView.showsVerticalScrollIndicator = false

        self.tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)

    }

    func setupNavigationBar() {

        self.navigationController?.navigationBar.topItem?.titleView = self.navigationTitleLabel

        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addJournal))

        self.navigationItem.rightBarButtonItem = rightButtonItem

        self.navigationController?.navigationBar.backgroundColor = UIColor.white

        self.navigationController?.navigationBar.tintColor = UIColor.red

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)

        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
}

// MARK: - Table view heightForRowAt

extension LandingTableViewController {

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        let naviBarHeight = self.navigationController?.navigationBar.bounds.height ?? 0

        let contentViewHeight = UIScreen.main.bounds.height - statusBarHeight - naviBarHeight

        return contentViewHeight / 3
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)

        let detailViewController = DetailViewController(nibName: "AddJournalViewController", bundle: nil)

        let journal = dataSource.object(at: indexPath)

        detailViewController.selectedJournal = journal

        detailViewController.context = self.managedObjectContext

        self.present(detailViewController, animated: true, completion: nil)
    }

}

// Button Functions
extension LandingTableViewController {
    @objc func addJournal() {

        let addJournalViewController = AddJournalViewController(nibName: "AddJournalViewController", bundle: nil)

        addJournalViewController.managedObjectContext = self.managedObjectContext

        self.present(addJournalViewController, animated: true, completion: nil)

    }
}
