// AllGroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка города
final class AllGroupTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var shadowView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
    }

    // MARK: - Public methods

    func configureGroup(model: Group) {
        avatarImageView.image = UIImage(named: model.avatarImageName)
        nameLabel.text = model.title
        descriptionLabel.text = model.description
    }
}
