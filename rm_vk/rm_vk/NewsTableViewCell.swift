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

    func configure(news: News) {
        avatarImageView.image = UIImage(named: news.avatarImageName)
        titleLabel.text = news.title
        timeSubtitleLabel.text = news.timeSubtitle
        descriptionLabel.text = news.description
        postImageView.image = UIImage(named: news.postImageName)
        viewsLabel.text = news.views
    }
}
