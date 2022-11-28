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

    var id = 0

    // MARK: - Private Properties

    private var currentIndex = 0 {
        didSet {
            updateTitle()
        }
    }

    private var networkService: NetworkServiceProtocol = NetworkService()
    private var photosImagesNames: [Photo] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createSwipeGestures()
        setupNavigationController()
        fetchPhotos()
    }

    // MARK: - Public methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.segueIdentifier,
              let photosCollectionViewController = segue.destination as? PhotosCollectionViewController
        else { return
        }
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
        guard currentIndex < photosImagesNames.count, currentIndex >= 0 else {
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
            guard let url = URL(string: self.photosImagesNames[self.currentIndex].urls.last?.url ?? "") else { return }
            self.photoImageView.load(url: url)
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
        navigationItem.title = "\(currentIndex + 1) из \(photosImagesNames.count)"
    }

    private func setupFirstImageView() {
        if !photosImagesNames.isEmpty {
            guard let url = URL(string: photosImagesNames[currentIndex].urls.last?.url ?? "") else { return }
            photoImageView.load(url: url)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

    private func fetchPhotos() {
        networkService.fetchPhotos(for: String(id)) { [weak self] item in
            guard let self = self else { return }
            switch item {
            case let .success(data):
                self.photosImagesNames = data.photos.photos
                self.setupFirstImageView()
                self.updateTitle()
            case let .failure(error):
                print(error)
            }
        }
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
