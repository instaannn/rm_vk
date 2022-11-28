// MyGroupsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

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

    private var groups: [Group] = []
    private var networkService: NetworkServiceProtocol = NetworkService()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        fetchGroups()
    }

    // MARK: - Public methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        cell.configure(group: groups[indexPath.row])
        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        guard editingStyle == .delete else { return }
        groups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    // MARK: - IBAction

    @IBAction private func addGroup(segue: UIStoryboardSegue) {
        guard segue.identifier == Constants.segueIdentifier,
              let allGroupsTableViewController = segue.source as? AllGroupsTableViewController,
              let indexPath = allGroupsTableViewController.tableView.indexPathForSelectedRow,
              !groups.contains(
                  where: { $0.name == allGroupsTableViewController.filterGroups[indexPath.row].name }
              ) else { return }
        let group = allGroupsTableViewController.filterGroups[indexPath.row]
        groups.append(group)
        tableView.reloadData()
    }

    // MARK: - Private Methods

    private func registerCell() {
        tableView.register(
            UINib(nibName: Constants.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }

    private func fetchGroups() {
        networkService.fetchGroups { [weak self] item in
            guard let self = self else { return }
            switch item {
            case let .success(data):
                self.groups = data.groups.groups
                self.tableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
    }
}
