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
    }

    // MARK: - Private Properties

    private var groups = [
        Group(
            avatarImageName: Constants.oneGroupName,
            title: Constants.oneGroupTitle,
            description: Constants.oneGroupDescription
        ),
        Group(
            avatarImageName: Constants.twoGroupName,
            title: Constants.twoGroupTitle,
            description: nil
        )
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let allGroupsTableViewController = segue.source as? AllGroupsTableViewController else { return }
            if let indexPath = allGroupsTableViewController.tableView.indexPathForSelectedRow {
                let group = allGroupsTableViewController.groups[indexPath.row]
                groups.append(group)
                tableView.reloadData()
            }
        }
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        cell.configureGroup(model: groups[indexPath.row])
        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Private Methods

    private func registerCell() {
        tableView.register(
            UINib(nibName: Constants.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
}
