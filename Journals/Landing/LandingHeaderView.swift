//
//  LandingHeaderView.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 11/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class LandingHeaderView: UIView {

    class var identifier: String { return String(describing: self) }

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var addButton: UIButton!

    override func awakeFromNib() {

        super.awakeFromNib()

        setupHeaderView()

    }

    func setupHeaderView() {

        titleLabel.text = "My Journals"

        titleLabel.textColor = UIColor.Custom.slate

        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)

        addButton.imageView?.image = #imageLiteral(resourceName: "icon_plus").withRenderingMode(.alwaysTemplate)

        addButton.tintColor = UIColor.Custom.dustyOrange

    }
}

extension LandingHeaderView {

    class func create() -> LandingHeaderView? {

        guard let nibView = UINib(nibName: self.identifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as? LandingHeaderView else {

            return UIView() as? LandingHeaderView
        }

        return nibView

    }

}
