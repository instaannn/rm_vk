// LikeControl.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомный контрол для лайка
final class LikeControl: UIControl {
    // MARK: - Constants

    private enum Constants {
        static let heartImageName = "suit.heart"
        static let fillHeartImageName = "suit.heart.fill"
        static let secondaryLabelColorName = "secondaryLabel"
    }

    // MARK: - IBOutlet

    @IBOutlet private var likeImageView: UIImageView!
    @IBOutlet private var likeCountLabel: UILabel!

    // MARK: - Private property

    private var isLike = false
    private var likeCount = 0

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        createGestureRecognizer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createGestureRecognizer()
    }

    // MARK: - Private methods

    private func createGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func tapAction(_: UITapGestureRecognizer) {
        isLike.toggle()

        guard isLike else {
            likeImageView.image = UIImage(systemName: Constants.heartImageName)
            likeImageView.tintColor = UIColor(named: Constants.secondaryLabelColorName)
            likeCount -= 1
            likeCountLabel.text = "\(likeCount)"
            likeCountLabel.textColor = UIColor(named: Constants.secondaryLabelColorName)
            return
        }
        likeImageView.image = UIImage(systemName: Constants.fillHeartImageName)
        likeImageView.tintColor = .systemRed
        likeCount += 1
        likeCountLabel.text = "\(likeCount)"
        likeCountLabel.textColor = .systemRed
    }
}
