// AllGroupsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран общего списка групп
final class AllGroupsTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "AllGroupTableViewCell"
        static let oneGroupImageName = "liza"
        static let twoGroupImageName = "maggie"
        static let oneGroupTitle = "Liza's club"
        static let twoGroupTitle = "Agu"
        static let oneGroupDescription = "Отличники"
        static let threeGroupImageName = "bart"
        static let threeGroupTitle = "Caramba"
    }

    // MARK: - Public Properties

    var groups = [
        Group(
            avatarImageName: Constants.oneGroupImageName,
            title: Constants.oneGroupTitle,
            description: Constants.oneGroupDescription
        ),
        Group(
            avatarImageName: Constants.twoGroupImageName,
            title: Constants.twoGroupTitle,
            description: nil
        ),
        Group(
            avatarImageName: Constants.threeGroupImageName,
            title: Constants.threeGroupTitle,
            description: nil
        ),
        Group(
            avatarImageName: Constants.oneGroupImageName,
            title: Constants.oneGroupTitle,
            description: Constants.oneGroupDescription
        ),
        Group(
            avatarImageName: Constants.twoGroupImageName,
            title: Constants.twoGroupTitle,
            description: nil
        ),
        Group(
            avatarImageName: Constants.threeGroupImageName,
            title: Constants.threeGroupTitle,
            description: nil
        )
    ]

    // MARK: - Public methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? AllGroupTableViewCell else { return UITableViewCell() }
        cell.configureGroup(model: groups[indexPath.row])
        return cell
    }
}
