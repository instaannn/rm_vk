// FooterTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка лайки/просмотры/репосты
final class FooterTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var viewsCountLabel: UILabel!

    // MARK: - Public methods

    func configure(item: Items) {
        guard let view = item.views?.count else { return }
        viewsCountLabel.text = String(view)
    }
}
