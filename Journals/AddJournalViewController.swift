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

        self.cancelButton.imageView?.backgroundColor = UIColor.Custom.buttonBackground

        self.cancelButton.layer.opacity = 1

        self.cancelButton.layer.shadowRadius = 4

    }

}
