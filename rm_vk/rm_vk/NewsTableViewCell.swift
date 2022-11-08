// NewsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка новостей
final class NewsTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var timeSubtitleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var postImageView: UIImageView!
    @IBOutlet private var viewsLabel: UILabel!

    // MARK: - Public methods

    func configure(model: News) {
        avatarImageView.image = UIImage(named: model.avatarImageName)
        titleLabel.text = model.title
        timeSubtitleLabel.text = model.timeSubtitle
        descriptionLabel.text = model.description
        postImageView.image = UIImage(named: model.postImageName)
        viewsLabel.text = model.views
    }
}
