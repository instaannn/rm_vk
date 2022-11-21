// FriendsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран списка друзей
final class FriendsTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "MainTableViewCell"
        static let segueIdentifier = "showAllPhotosViewController"
        static let emptyString = ""
    }

    // MARK: - Private Properties

    private let users = Users.getUsers()
    private var sortedUsers = [Character: [User]]()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        sortUsers()
        setupNavigationController()
    }

    // MARK: - Public methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        sortedUsers.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedUsersKeys = sortedUsers.keys.sorted()
        let userCount = sortedUsers[sortedUsersKeys[section]]?.count ?? 0
        return userCount
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sortedUsers.keys.sorted().map { String($0) }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedUsers.keys.sorted()[section])
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier, for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        guard let user = getOneUser(indexPath: indexPath) else { return UITableViewCell() }
        cell.configureUser(user: user)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = getOneUser(indexPath: indexPath) else { return }
        performSegue(withIdentifier: Constants.segueIdentifier, sender: user.photosImageNames)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.segueIdentifier,
              let allPhotosViewController = segue.destination as? AllPhotosViewController,
              let indexPath = tableView.indexPathForSelectedRow,
              let photosImagesNames = getOneUser(indexPath: indexPath)?.photosImageNames else { return }
        allPhotosViewController.photosImagesNames = photosImagesNames
    }

    override func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
        UIView.animate(
            withDuration: 0.9,
            delay: 0.05 * Double(indexPath.row),
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.1,
            options: .curveEaseIn
        ) {
            cell.transform = CGAffineTransform(
                translationX: cell.contentView.frame.width,
                y: cell.contentView.frame.height
            )
        }
    }

    // MARK: - Private Methods

    private func registerCell() {
        tableView.register(
            UINib(nibName: Constants.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }

    private func sortUsers() {
        sortedUsers = sort(users: users)
    }

    private func sort(users: [User]) -> [Character: [User]] {
        var sortedUsers = [Character: [User]]()
        users.forEach {
            guard let firstLetter = $0.name.first else { return }
            guard var charUsers = sortedUsers[firstLetter] else { sortedUsers[firstLetter] = [$0]
                return
            }
            charUsers.append($0)
            sortedUsers[firstLetter] = charUsers
        }
        return sortedUsers
    }

    private func getOneUser(indexPath: IndexPath) -> User? {
        let firstChar = sortedUsers.keys.sorted()[indexPath.section]
        guard let users = sortedUsers[firstChar] else { return nil }
        let user = users[indexPath.row]
        return user
    }

    private func setupNavigationController() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: Constants.emptyString,
            style: .plain,
            target: nil,
            action: nil
        )
    }
}
