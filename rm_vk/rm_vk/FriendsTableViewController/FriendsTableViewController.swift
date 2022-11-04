// FriendsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран списка друзей
final class FriendsTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "MainTableViewCell"
        static let segueIdentifier = "showPhotosCollectionView"
        static let friendOneName = "Homer"
        static let friendTwoName = "Marge"
        static let friendThreeName = "Liza"
        static let friendFourName = "Bart"
        static let friendFiveName = "Maggie"
        static let friendDescription = "Springfield"
    }

    // MARK: - Private Properties

    private let users = [
        User(
            avatarImageName: Constants.friendOneName.lowercased(),
            name: Constants.friendOneName,
            description: Constants.friendDescription
        ),
        User(
            avatarImageName: Constants.friendTwoName.lowercased(),
            name: Constants.friendTwoName,
            description: Constants.friendDescription
        ),
        User(
            avatarImageName: Constants.friendThreeName.lowercased(),
            name: Constants.friendThreeName,
            description: nil
        ),
        User(
            avatarImageName: Constants.friendFourName.lowercased(),
            name: Constants.friendFourName,
            description: Constants.friendDescription
        ),
        User(
            avatarImageName: Constants.friendFiveName.lowercased(),
            name: Constants.friendFiveName,
            description: nil
        ),
        User(
            avatarImageName: Constants.friendOneName.lowercased(),
            name: Constants.friendOneName,
            description: Constants.friendDescription
        ),
        User(
            avatarImageName: Constants.friendTwoName.lowercased(),
            name: Constants.friendTwoName,
            description: Constants.friendDescription
        ),
        User(
            avatarImageName: Constants.friendThreeName.lowercased(),
            name: Constants.friendThreeName,
            description: nil
        ),
        User(
            avatarImageName: Constants.friendFourName.lowercased(),
            name: Constants.friendFourName,
            description: Constants.friendDescription
        ),
        User(
            avatarImageName: Constants.friendFiveName.lowercased(),
            name: Constants.friendFiveName,
            description: nil
        )
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    // MARK: - Public methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier, for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        cell.configureUser(model: users[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.segueIdentifier, sender: users[indexPath.row].avatarImageName)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.segueIdentifier,
              let photosCollectionViewController = segue.destination as? PhotosCollectionViewController,
              let imageName = sender as? String else { return }
        photosCollectionViewController.imageName = imageName
    }

    // MARK: - Private Methods

    private func registerCell() {
        tableView.register(
            UINib(nibName: Constants.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
}
