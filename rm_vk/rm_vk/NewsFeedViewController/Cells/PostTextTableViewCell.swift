// PostTextTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка текстовый пост
final class PostTextTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var postLabel: UILabel!

    // MARK: - Public methods

    func configure(postItem: PostItem) {
        postLabel.text = postItem.text
    }
}
