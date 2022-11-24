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
        addTapGestureRecognizer()
    }

    // MARK: - Public methods

    func configureUser(user: User) {
        guard let string = user.photoImageName,
              let url = URL(string: string) else { return }
        avatarImageView.load(url: url)
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        if let city = user.city {
            descriptionLabel.text = city.title
        }
    }

    func configureGroup(group: Group) {
        guard let string = group.photoImageName,
              let url = URL(string: string) else { return }
        avatarImageView.load(url: url)
        nameLabel.text = group.name
        descriptionLabel.text = group.description
    }

    // MARK: - Private methods

    private func setupShadowView() {
        shadowView.layer.shadowColor = UIColor(named: Constants.lightColorName)?.cgColor
    }

    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showAffineTransformAction))
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        avatarImageView.isUserInteractionEnabled = true
    }

    @objc private func showAffineTransformAction() {
        avatarImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(
            withDuration: 1,
            delay: 0.3,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: .curveEaseOut,
            animations: {
                self.avatarImageView.transform = .identity
            },
            completion: nil
        )
    }
}
