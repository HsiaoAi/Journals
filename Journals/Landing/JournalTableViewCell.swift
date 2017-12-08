//
//  journalTableViewCell.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var seperatorView: UIView!

    @IBOutlet weak var seperatorCircleView: UILabel!

    @IBOutlet weak var photoImageViewShadow: UIImageView!

    override func awakeFromNib() {

        super.awakeFromNib()

        setupPhotoImageView()

        setupTitleLabel()

        setupSeperatorView()
    }

    func setupPhotoImageView() {

        self.photoImageView.tintColor = UIColor.Custom.coolGrey

        self.photoImageView.contentMode = .center

        self.photoImageView.image = #imageLiteral(resourceName: "icon-photo").withRenderingMode(.alwaysTemplate)

        self.photoImageView.layer.cornerRadius = 8

        self.photoImageView.clipsToBounds = true

        self.photoImageViewShadow.layer.shadowOpacity = 1

        self.photoImageViewShadow.clipsToBounds = false

        self.photoImageViewShadow.layer.shadowOffset = CGSize.zero

        self.photoImageViewShadow.layer.shadowRadius = 10

        self.photoImageViewShadow.layer.shadowColor = UIColor.Custom.coolGrey.cgColor

        self.photoImageViewShadow.layer.shadowPath =

            UIBezierPath(roundedRect: photoImageViewShadow.bounds, cornerRadius: 10).cgPath

    }

    func setupTitleLabel() {

        self.titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        self.titleLabel.textColor = UIColor.Custom.slate

    }

    func setupSeperatorView() {

        self.seperatorView.backgroundColor = UIColor.Custom.coolGrey

        self.seperatorCircleView.textColor = UIColor.Custom.coolGrey

    }

}
