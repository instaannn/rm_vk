// MyGroupsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import UIKit

/// Экран списка групп пользователя
final class MyGroupsTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "MainTableViewCell"
        static let oneGroupName = "homer"
        static let twoGroupName = "marge"
        static let oneGroupTitle = "We love Homer"
        static let twoGroupTitle = "Blue Hair"
        static let oneGroupDescription = "клуб любителей гомера"
        static let segueIdentifier = "addGroup"
    }

    // MARK: - Private Properties

    private var networkService: NetworkServiceProtocol = NetworkService()
    private var groupsToken: NotificationToken?
    private var groups: Results<Group>?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getGroups()
    }

    // MARK: - Public methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        guard let group = groups?[indexPath.row] else { return UITableViewCell() }
        cell.configure(group: group)
        return cell
    }

    // MARK: - Private Methods

    private func registerCell() {
        tableView.register(
            UINib(nibName: Constants.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }

    private func getGroups() {
        guard let objects = RealmService.get(Group.self) else { return }
        addUserToken(result: objects)
        groups = objects
        networkService.fetchGroups()
    }

    private func addUserToken(result: Results<Group>) {
        groupsToken = result.observe { [weak self] change in
            guard let self = self else { return }
            switch change {
            case .initial:
                break
            case .update:
                self.groups = result
                self.tableView.reloadData()
            case let .error(error):
                print(error.localizedDescription)
            }
        }
    }
}
