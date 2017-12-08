//
//  AddJournalViewController.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit
import ChameleonFramework
import CoreData

class AddJournalViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var contentTextField: UITextField!

    @IBOutlet weak var saveButton: UIButton!

    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSaveButton()

        setupCancelButton()

        setupPhotoImageView()

        print("AddTaskController Context: \(managedObjectContext.description)")

    }

}

// CoreDate

extension AddJournalViewController {

}

// Setup UI functions

extension AddJournalViewController {

    func setupSaveButton() {

        self.saveButton.tintColor = UIColor.white

        self.saveButton.layer.cornerRadius = 22

        self.saveButton.backgroundColor = UIColor.Custom.dustyOrange

        self.saveButton.layer.shadowOpacity = 1

        self.saveButton.layer.shadowRadius = 10

        self.saveButton.layer.shadowColor = UIColor.Custom.blush.cgColor

        self.saveButton.addTarget(self, action: #selector(handelSave), for: .touchUpInside)

        //handelSave
    }

    func setupPhotoImageView() {

        self.photoImageView.backgroundColor =

            UIColor(gradientStyle: .radial,

                    withFrame: self.photoImageView.frame,

                    andColors: [UIColor.Custom.slate, UIColor.Custom.darkSlate])

        self.photoImageView.tintColor = UIColor.Custom.coolGrey

        self.photoImageView.contentMode = .center

        self.photoImageView.image = #imageLiteral(resourceName: "icon-photo").withRenderingMode(.alwaysTemplate)

    }

    func setupCancelButton() {

        self.cancelButton.imageView?.image = #imageLiteral(resourceName: "button_close").withRenderingMode(.alwaysTemplate)

        self.cancelButton.imageView?.tintColor = UIColor.white

        self.cancelButton.imageView?.backgroundColor = UIColor.clear

        self.cancelButton.layer.opacity = 1

        self.cancelButton.layer.shadowRadius = 4

        self.cancelButton.addTarget(self, action: #selector(handelCancel), for: .touchUpInside)

    }

}

// Button Functions and others

extension AddJournalViewController {

    @objc func handelCancel() {

        self.dismiss(animated: true, completion: nil)

    }

    @objc func handelSave() {

        let title = self.titleTextField.text ?? ""

        let content = self.contentTextField.text ?? ""

        let createDate = NSDate()

        guard let journal = NSEntityDescription.insertNewObject(forEntityName: "Journal", into: managedObjectContext) as? Journal else {
            print("here")
            return
        }

        journal.title = title

        journal.content = content

        journal.createDate = createDate

        journal.isCompleted = true

        managedObjectContext.saveChanges()

        self.dismiss(animated: true, completion: nil)

    }

}
