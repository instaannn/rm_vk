// FriendsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
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

    private var sortedUsersMap = [Character: [User]]()
    private var networkService: NetworkServiceProtocol = NetworkService()
    private let realm = try? Realm()
    private var usersToken: NotificationToken?
    private var users: Results<User>?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupNavigationController()
        fetchFriends()
    }

    // MARK: - Public methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        sortedUsersMap.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedUsersKeys = sortedUsersMap.keys.sorted()
        let userCount = sortedUsersMap[sortedUsersKeys[section]]?.count ?? 0
        return userCount
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sortedUsersMap.keys.sorted().map { String($0) }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedUsersMap.keys.sorted()[section])
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier, for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        guard let user = getOneUser(indexPath: indexPath) else { return UITableViewCell() }
        cell.configure(user: user)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = getOneUser(indexPath: indexPath) else { return }
        performSegue(withIdentifier: Constants.segueIdentifier, sender: user.id)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.segueIdentifier,
              let allPhotosViewController = segue.destination as? AllPhotosViewController,
              let indexPath = tableView.indexPathForSelectedRow,
              let id = getOneUser(indexPath: indexPath)?.id else { return }
        allPhotosViewController.id = id
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
        guard let users = users else { return }
        sortedUsersMap = sort(users: Array(users))
    }

    private func sort(users: [User]) -> [Character: [User]] {
        var sortedUsers = [Character: [User]]()
        users.forEach {
            guard let firstLetter = $0.lastName.first else { return }
            guard var charUsers = sortedUsers[firstLetter] else { sortedUsers[firstLetter] = [$0]
                return
            }
            charUsers.append($0)
            sortedUsers[firstLetter] = charUsers
        }
        return sortedUsers
    }

    private func getOneUser(indexPath: IndexPath) -> User? {
        let firstChar = sortedUsersMap.keys.sorted()[indexPath.section]
        guard let users = sortedUsersMap[firstChar] else { return nil }
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

    private func fetchFriends() {
        guard let objects = realm?.objects(User.self) else { return }
        addUserToken(result: objects)
        users = objects
        sortUsers()
        networkService.fetchFriends { item in
            switch item {
            case let .success(data):
                RealmService.save(items: data.users.users)
            case let .failure(error):
                print(error)
            }
        }
    }

    private func addUserToken(result: Results<User>) {
        usersToken = result.observe { change in
            switch change {
            case .initial:
                break
            case .update:
                self.users = result
                self.sortUsers()
                self.tableView.reloadData()
            case let .error(error):
                print(error.localizedDescription)
            }
        }
    }
}
