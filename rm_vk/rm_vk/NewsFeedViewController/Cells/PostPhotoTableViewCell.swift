// PostPhotoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка пост с фото
final class PostPhotoTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var photoPostImageView: UIImageView!

    // MARK: - Public methods

    func configure(news: String) {
        guard let url = URL(string: news) else { return }
        photoPostImageView.load(url: url)
    }
}
