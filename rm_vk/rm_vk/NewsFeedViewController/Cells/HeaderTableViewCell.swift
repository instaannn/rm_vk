// HeaderTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка аватар и имя/название
final class HeaderTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var avatarImageView: UIImageView!

    // MARK: - Public methods

    func configure(news: HeaderItem) {
        titleLabel.text = news.title
        subtitleLabel.text = news.subtitle
        guard let url = URL(string: news.avatarImageName) else { return }
        avatarImageView.load(url: url)
    }
}
