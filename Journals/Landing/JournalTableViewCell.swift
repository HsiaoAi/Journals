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

        self.photoImageView.layer.shadowOpacity = 1

        self.photoImageView.layer.shadowOffset = CGSize(width: 0, height: 0)

        self.photoImageView.layer.shadowRadius = 10
    }

    func setupTitleLabel() {

        self.titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        self.titleLabel.textColor = UIColor.Custom.slate

    }

    func setupSeperatorView() {

        self.seperatorView.backgroundColor = UIColor.Custom.coolGrey

        self.seperatorCircleView.textColor = UIColor.Custom.coolGrey

    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
