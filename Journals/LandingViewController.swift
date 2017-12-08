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
        self.view.backgroundColor = UIColor.red
    }
}

// Setup UI functions
extension LandingTableViewController {
    func setupNavigationBar() {

        self.navigationController?.navigationBar.topItem?.titleView = self.navigationTitleLabel

        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addJournal))

        self.navigationItem.rightBarButtonItem = rightButtonItem

        self.navigationController?.navigationBar.backgroundColor = UIColor.clear

        self.navigationController?.navigationBar.tintColor = UIColor.red
    }
}

extension LandingTableViewController {
    @objc func addJournal() {

    }
}
