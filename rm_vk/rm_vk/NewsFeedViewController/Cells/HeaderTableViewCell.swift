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

    func configure(headerItem: HeaderItem) {
        titleLabel.text = headerItem.title
        subtitleLabel.text = headerItem.subtitle
        guard let url = URL(string: headerItem.avatarImageName) else { return }
        avatarImageView.load(url: url)
    }
}
