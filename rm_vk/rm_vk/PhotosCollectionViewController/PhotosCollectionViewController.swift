// PhotosCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображения фотографий друга
final class PhotosCollectionViewController: UICollectionViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "PhotoCollectionViewCell"
        static let imageName = ""
    }

    // MARK: - Public Properties

    var imageName = Constants.imageName

    // MARK: - Public methods

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(imageName: imageName)
        return cell
    }
}
