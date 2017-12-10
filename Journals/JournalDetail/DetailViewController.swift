//
//  DetailViewController.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit
import ChameleonFramework
import CoreData

class DetailViewController: UIViewController {

    // CoreData properties

    var selectedJournal: Journal?

    var context: NSManagedObjectContext!

    var pickedImage: UIImage?

    @IBOutlet weak var addPicLabel: UILabel!

    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var contentTextField: UITextView!

    @IBOutlet weak var saveButton: UIButton!

    @IBAction func pickImage(_ sender: UIButton) {

        self.imagePicker.allowsEditing = false

        confirm()

        self.imagePicker.allowsEditing = false

    }

    func confirm() {

        let alertController = UIAlertController(
            title: "",
            message: "How do you want to add picture?",
            preferredStyle: .alert)

        let photoAction = UIAlertAction(
            title: "Photo",
            style: .default,
            handler: {
                _ in

                print("photo")

                self.imagePicker.sourceType = .photoLibrary

                self.present(self.imagePicker, animated: true, completion: nil)
        })

        alertController.addAction(photoAction)

        let cameraAction = UIAlertAction(
            title: "Camera",
            style: .default,
            handler: {

                _ in

                print("camera")

                self.imagePicker.sourceType = .camera

                self.imagePicker.cameraCaptureMode = .photo

                self.imagePicker.modalPresentationStyle = .fullScreen

                self.present(self.imagePicker, animated: true, completion: nil)

        })

        alertController.addAction(cameraAction)

        self.present(
            alertController,
            animated: true,
            completion: nil)
    }

    var managedObjectContext: NSManagedObjectContext!

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSaveButton()

        setupCancelButton()

        setupPhotoImageView()

        setupSelectedJournal()

        self.imagePicker.delegate = self

    }

}

// Setup UI functions

extension DetailViewController {

    func setupContentTextField() {

        self.titleTextField.delegate = self

        self.contentTextField.autocapitalizationType = .none

        self.contentTextField.textColor = UIColor.Custom.slate

        self.contentTextField.delegate = self

        self.contentTextField.textAlignment = .natural

    }

    func setupSelectedJournal() {

        self.titleTextField.text = self.selectedJournal?.title

        self.contentTextField.text = self.selectedJournal?.content

    }

    func setupSaveButton() {

        self.saveButton.tintColor = UIColor.white

        self.saveButton.layer.cornerRadius = 22

        self.saveButton.backgroundColor = UIColor.Custom.dustyOrange

        self.saveButton.layer.shadowOpacity = 1

        self.saveButton.layer.shadowRadius = 10

        self.saveButton.layer.shadowColor = UIColor.Custom.blush.cgColor

        self.saveButton.addTarget(self, action: #selector(handelSave), for: .touchUpInside)

    }

    func setupPhotoImageView() {

        self.photoImageView.backgroundColor =

            UIColor(gradientStyle: .radial,

                    withFrame: self.photoImageView.frame,

                    andColors: [UIColor.Custom.slate, UIColor.Custom.darkSlate])

        self.photoImageView.tintColor = UIColor.Custom.coolGrey

        self.photoImageView.contentMode = .center

        self.photoImageView.image = #imageLiteral(resourceName: "icon-photo").withRenderingMode(.alwaysTemplate)

        if let  photo = selectedJournal?.photo as Data?,

            let image = UIImage(data: photo) {

            self.photoImageView.image = image

            self.photoImageView.contentMode = .scaleAspectFill

            self.addPicLabel.text = ""

        }

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

extension DetailViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.view.endEditing(true)

    }

}

// UITextViewDelegate

extension DetailViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {

        textView.text = nil

        self.contentTextField.textColor = UIColor.Custom.slate

    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        if text == "\n" {

            textView.resignFirstResponder()

            return false
        }

        return true

    }

}

// Button Functions and others

extension DetailViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        self.view.endEditing(true)

        return true
    }
}

// UIImagePickerControllerDelegate

extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {

        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {

            self.photoImageView.contentMode = .scaleAspectFill

            self.pickedImage = pickedImage

            self.photoImageView.image = pickedImage

            self.addPicLabel.text = ""

        }

        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        dismiss(animated: true, completion: nil)
    }

}

// Button Functions and others

extension DetailViewController {

    @objc func handelCancel() {

        self.dismiss(animated: true, completion: nil)

    }

    @objc func handelSave() {

        let title = self.titleTextField.text ?? ""

        let content = self.contentTextField.text ?? ""

        guard let journal = self.selectedJournal else { return }

        if let photo = self.pickedImage, let imageData = UIImagePNGRepresentation(photo) as NSData? {

            journal.photo = imageData

        }

        journal.title = title

        journal.content = content

        context.saveChanges()

        self.dismiss(animated: true, completion: nil)

    }

}
