// PhotoCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка коллекции с фотографией
final class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var photoImageView: UIImageView!

    // MARK: - Public methods

    func configure(imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}
