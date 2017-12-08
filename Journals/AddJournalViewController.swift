//
//  AddJournalViewController.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class AddJournalViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var contentTextField: UITextField!

    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCancelButton()

    }

    func setupCancelButton() {

        self.cancelButton.imageView?.image = #imageLiteral(resourceName: "button_close").withRenderingMode(.alwaysTemplate)

        self.cancelButton.imageView?.tintColor = UIColor.white

        self.cancelButton.imageView?.backgroundColor = UIColor.clear

        self.cancelButton.layer.opacity = 1

        self.cancelButton.layer.shadowRadius = 4

        self.cancelButton.addTarget(self, action: #selector(handelCancel), for: .touchUpInside)

    }

    @objc func handelCancel() {

        self.dismiss(animated: true, completion: nil)

    }

}
