// PostPhotoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка пост с фото
final class PostPhotoTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var photoPostImageView: UIImageView!

    // MARK: - Public methods

    func configure(item: Items) {
        guard let url = URL(string: item.attachments?.first?.photo?.urls.last?.url ?? "") else { return }
        photoPostImageView.load(url: url)
    }
}
