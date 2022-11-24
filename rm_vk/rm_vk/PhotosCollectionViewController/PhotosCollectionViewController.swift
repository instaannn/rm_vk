// PhotosCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображения фотографий друга
final class PhotosCollectionViewController: UICollectionViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "PhotoCollectionViewCell"
    }

    // MARK: - Public Properties

    var photosImagesNames: [Photo] = []

    // MARK: - Public methods

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosImagesNames.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(photo: photosImagesNames[indexPath.row])
        return cell
    }
}
