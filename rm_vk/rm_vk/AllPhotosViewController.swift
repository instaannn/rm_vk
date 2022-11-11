// AllPhotosViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Анимация отображения всех фото друга
final class AllPhotosViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let segueIdentifier = "showUserPhoto"
        static let emptyString = ""
    }

    // MARK: - IBOutlet

    @IBOutlet private var photoImageView: UIImageView!

    // MARK: - Public Properties

    var photosImagesNames: [String] = []

    // MARK: - Private Properties

    private var photoImages: [UIImage] {
        photosImagesNames.compactMap { UIImage(named: $0) }
    }

    private var currentIndex = 0 {
        didSet {
            updateTitle()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createSwipeGestures()
        setupNavigationController()
        setupFirstImageView()
        updateTitle()
    }

    // MARK: - Public methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.segueIdentifier,
              let photosCollectionViewController = segue.destination as? PhotosCollectionViewController else { return }
        photosCollectionViewController.photosImagesNames = photosImagesNames
    }

    // MARK: - Private Methods

    private func createSwipeGestures() {
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction))
        swipeGestureRecognizerRight.direction = .right
        view.addGestureRecognizer(swipeGestureRecognizerRight)

        let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction))
        swipeGestureRecognizerLeft.direction = .left
        view.addGestureRecognizer(swipeGestureRecognizerLeft)
    }

    private func animationSwipe(translationX: Int, index: Int) {
        currentIndex += index
        guard currentIndex < photoImages.count, currentIndex >= 0 else {
            currentIndex -= index
            return
        }
        UIView.animate(withDuration: 1) {
            let translation = CGAffineTransform(translationX: CGFloat(translationX), y: 0)
            self.photoImageView.transform = translation.concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            self.photoImageView.layer.opacity = 0.2
        } completion: { _ in
            self.photoImageView.layer.opacity = 1
            self.photoImageView.transform = .identity
            self.photoImageView.image = self.photoImages[self.currentIndex]
        }
    }

    private func setupNavigationController() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: Constants.emptyString,
            style: .plain,
            target: nil,
            action: nil
        )
    }

    private func updateTitle() {
        navigationItem.title = "\(currentIndex + 1) из \(photoImages.count)"
    }

    private func setupFirstImageView() {
        photoImageView.image = photoImages[currentIndex]
    }

    @objc private func swipeGestureAction(_ sender: UIGestureRecognizer) {
        guard let swipeGestureRecognizer = sender as? UISwipeGestureRecognizer else { return }
        switch swipeGestureRecognizer.direction {
        case .right:
            animationSwipe(translationX: 500, index: -1)
        case .left:
            animationSwipe(translationX: -500, index: 1)
        default:
            break
        }
    }
}
