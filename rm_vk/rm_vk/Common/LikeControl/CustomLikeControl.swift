// CustomLikeControl.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Универсальный лайк контрол
@IBDesignable final class CustomLikeControl: UIControl {
    // MARK: - Constants

    private enum Constants {
        static let heartImageName = "suit.heart"
        static let fillHeartImageName = "suit.heart.fill"
        static let secondaryLabelColorName = "secondaryLabel"
    }

    // MARK: - Private Visual Components

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()

    private lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.text = "\(likeCount)"
        label.textAlignment = .center
        label.textColor = UIColor(named: Constants.secondaryLabelColorName)
        return label
    }()

    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.heartImageName), for: .normal)
        button.tintColor = UIColor(named: Constants.secondaryLabelColorName)
        button.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Private Properties

    private var likeCount = 0

    @IBInspectable private var isLiked: Bool = false {
        didSet {
            updateLikeStatus()
        }
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        setupStackView()
    }

    // MARK: - Private Methods

    private func setupStackView() {
        stackView.frame = bounds
    }

    private func setupView() {
        stackView = UIStackView(arrangedSubviews: [likeButton, likeCountLabel])
        addSubview(stackView)
    }

    private func updateLikeStatus() {
        guard isLiked else {
            likeButton.setImage(UIImage(systemName: Constants.heartImageName), for: .normal)
            likeButton.tintColor = UIColor(named: Constants.secondaryLabelColorName)
            likeCountLabel.textColor = UIColor(named: Constants.secondaryLabelColorName)
            likeCount -= 1
            likeCountLabel.text = "\(likeCount)"
            return
        }
        likeCount += 1
        likeCountLabel.text = "\(likeCount)"
        likeButton.setImage(UIImage(systemName: Constants.fillHeartImageName), for: .normal)
        likeButton.tintColor = .systemRed
        likeCountLabel.textColor = .systemRed

        UIView.animate(
            withDuration: 0.4,
            animations: {
                self.likeButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.4) {
                    self.likeButton.transform = CGAffineTransform.identity
                }
            }
        )
    }

    @objc private func likeButtonAction(_ sender: UIButton) {
        isLiked.toggle()
        likeCountLabel.shake()
    }
}
