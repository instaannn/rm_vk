// FooterTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка лайки/просмотры/репосты
final class FooterTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var viewsCountLabel: UILabel!

    // MARK: - Public methods

    func configure(count: Int) {
        viewsCountLabel.text = String(count)
    }
}
