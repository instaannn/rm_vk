// PhotoCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка коллекции с фотографией
final class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var photoImageView: UIImageView!

    // MARK: - Public methods

    func configure(photo: Photo) {
        guard let url = URL(string: photo.urls.last?.url ?? "") else { return }
        photoImageView.load(url: url)
    }
}
