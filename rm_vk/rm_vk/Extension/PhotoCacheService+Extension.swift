// PhotoCacheService+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для  PhotoCacheService обновление таблицы
extension PhotoCacheService {
    /// Обновление UITableViewController
    class TableViewController: DataReloadable {
        // MARK: - Private Properties

        private let tableViewController: UITableViewController

        // MARK: - Initializers

        init(tableViewController: UITableViewController) {
            self.tableViewController = tableViewController
        }

        // MARK: - Public methods

        func reloadRow(atIndexpath indexPath: IndexPath) {
            tableViewController.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
