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

    @IBOutlet weak var contentTextField: UITextView!

    @IBOutlet weak var saveButton: UIButton!

    @IBOutlet weak var addPicLabel: UILabel!

    @IBAction func pickImage(_ sender: UIButton) {

        self.imagePicker.allowsEditing = false

        self.imagePicker.sourceType = .photoLibrary

        present(imagePicker, animated: true, completion: nil)

    }

    var managedObjectContext: NSManagedObjectContext!

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupContentTextField()

        setupSaveButton()

        setupCancelButton()

        setupPhotoImageView()

        self.imagePicker.delegate = self

    }

}

// Setup UI functions

extension AddJournalViewController {

    func setupContentTextField() {

        self.contentTextField.autocapitalizationType = .none

        self.contentTextField.textColor = UIColor.Custom.slate

        self.contentTextField.text = "Content"

        self.contentTextField.delegate = self

        self.contentTextField.textAlignment = .natural

    }

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

// UIImagePickerControllerDelegate

extension AddJournalViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {

        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {

            self.photoImageView.contentMode = .scaleAspectFill

            self.photoImageView.image = pickedImage

            self.addPicLabel.text = ""

        }

        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        dismiss(animated: true, completion: nil)
    }

}

// UITextViewDelegate

extension AddJournalViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {

            textView.text = nil

    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {

        self.view.endEditing(true)

        return true
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

        let photo = self.photoImageView.image ?? UIImage()

        guard let imageData = UIImagePNGRepresentation(photo) as NSData? else {
            print("No pic"); return
        }

        let createDate = NSDate()

        guard let journal = NSEntityDescription.insertNewObject(forEntityName: "Journal", into: managedObjectContext) as? Journal else {
            print("here")
            return
        }

        journal.title = title

        journal.content = content

        journal.createDate = createDate

        journal.isCompleted = true

        journal.photo = imageData

        managedObjectContext.saveChanges()

        self.dismiss(animated: true, completion: nil)

    }

}
