// NewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Гланый экран новостей
final class NewsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "NewsTableViewCell"
        static let searchQuery = "Music"
    }

    // MARK: - Private Properties

    private let netWorkService = NetWorkService()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    private func fetchData() {
        netWorkService.sendRequest(urlString: RequestType.groups.urlString)
        netWorkService.sendRequest(urlString: RequestType.friends.urlString)
        netWorkService.sendRequest(urlString: RequestType.photos(id: 1).urlString)
        netWorkService.sendRequest(urlString: RequestType.searchGroups(
            searchQuery: Constants.searchQuery
        ).urlString)
    }
}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AllNews.getNews().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier, for: indexPath
        ) as? NewsTableViewCell else { return UITableViewCell() }
        cell.configure(news: AllNews.getNews()[indexPath.row])
        return cell
    }
}
