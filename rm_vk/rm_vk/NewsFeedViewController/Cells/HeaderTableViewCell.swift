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

    func configure(item: Items) {
        titleLabel.text = item.authorName
        let date = Date(timeIntervalSince1970: item.date ?? 0)
        guard let dateString = DateFormatter.bigDateFormatter.string(for: date) else { return }
        subtitleLabel.text = dateString
        guard let url = URL(string: item.avatarUrl ?? "") else { return }
        avatarImageView.load(url: url)
    }
}
