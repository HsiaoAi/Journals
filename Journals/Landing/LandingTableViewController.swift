//
//  ViewController.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class LandingTableViewController: UITableViewController {

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

        setupNavigationBar()

        setupTableView()

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

    }

    func setupNavigationBar() {

        self.navigationController?.navigationBar.topItem?.titleView = self.navigationTitleLabel

        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addJournal))

        self.navigationItem.rightBarButtonItem = rightButtonItem

        self.navigationController?.navigationBar.backgroundColor = UIColor.white

        self.navigationController?.navigationBar.tintColor = UIColor.red

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 50)

    }
}

// MARK: - Table view data source

extension LandingTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        let naviBarHeight = self.navigationController?.navigationBar.bounds.height ?? 0

        print(naviBarHeight)

        let contentViewHeight = UIScreen.main.bounds.height - statusBarHeight - naviBarHeight

        return contentViewHeight / 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "JournalTableViewCell",
            for: indexPath
            ) as? JournalTableViewCell else { return JournalTableViewCell() }

        return cell
    }

}

// Button Functions
extension LandingTableViewController {
    @objc func addJournal() {

    }
}
