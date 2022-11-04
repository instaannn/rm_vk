// MainTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главная универсальная ячейка
final class MainTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let lightColorName = "lightColor"
    }

    // MARK: - IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var shadowView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadowView()
    }

    // MARK: - Public methods

    func configureUser(model: User) {
        avatarImageView.image = UIImage(named: model.avatarImageName)
        nameLabel.text = model.name
        descriptionLabel.text = model.description
    }

    func configureGroup(model: Group) {
        avatarImageView.image = UIImage(named: model.avatarImageName)
        nameLabel.text = model.title
        descriptionLabel.text = model.description
    }

    // MARK: - Private methods

    private func setupShadowView() {
        shadowView.layer.shadowColor = UIColor(named: Constants.lightColorName)?.cgColor
    }
}
