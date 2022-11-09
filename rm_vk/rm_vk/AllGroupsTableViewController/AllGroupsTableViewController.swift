// AllGroupsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран общего списка групп
final class AllGroupsTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "AllGroupTableViewCell"
    }

    // MARK: - IBOutlet

    @IBOutlet private var searchBar: UISearchBar!

    // MARK: - Private Properties

    private(set) var groups = Groups.getGroups()
    private(set) var filterGroups: [Group] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterGroups()
    }

    // MARK: - Public methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? AllGroupTableViewCell else { return UITableViewCell() }
        cell.configureGroup(model: filterGroups[indexPath.row])
        return cell
    }

    // MARK: - Private Methods

    private func setupFilterGroups() {
        filterGroups = groups
    }
}

// MARK: - UISearchBarDelegate

extension AllGroupsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterGroups = []

        if searchText.isEmpty {
            setupFilterGroups()
        } else {
            for group in groups where group.title.lowercased().contains(searchText.lowercased()) {
                filterGroups.append(group)
            }
        }
        tableView.reloadData()
    }
}
