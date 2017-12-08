//
//  journalTableViewCell.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    @IBOutlet weak var imageButton: UIButton!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var seperatorView: UIView!

    @IBOutlet weak var seperatorCircleView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupImageButton()
        setupTitleLabel()
        setupSeperatorView()
    }

    func setupImageButton() {

        self.imageButton.imageView?.contentMode = .center

        self.imageButton.imageView?.image = #imageLiteral(resourceName: "icon-photo").withRenderingMode(.alwaysTemplate)
    }

    func setupTitleLabel() {

        self.titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        self.titleLabel.textColor = UIColor.Custom.slate

    }

    func setupSeperatorView() {

        self.seperatorView.backgroundColor = UIColor.Custom.coolGrey

        self.seperatorCircleView.textColor = UIColor.Custom.coolGrey

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
