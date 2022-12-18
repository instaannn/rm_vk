// NewsFeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Гланый экран новостей
final class NewsFeedViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let headerTableViewCellIdentifier = "HeaderTableViewCell"
        static let postTextTableViewCellIdentifier = "PostTextTableViewCell"
        static let postPhotoTableViewCellIdentifier = "PostPhotoTableViewCell"
        static let footerTableViewCellIdentifier = "FooterTableViewCell"
    }

    // MARK: - IBOutlet

    @IBOutlet private var tableView: UITableView!

    // MARK: - Visual Components

    private let refreshControl = UIRefreshControl()

    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var cellTypes: [CellType] = [.header, .post, .photoPost, .footer]
    private var news: NewsFeed?
    private var isLoading = false
    private var nextPageValue = ""

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
        setupRefreshControl()
        setupTableView()
    }

    // MARK: - Private Methods

    private func setupTableView() {
        tableView.prefetchDataSource = self
    }

    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    private func fetchNews() {
        networkService.fetchNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.news = self.filterNews(newsFeed: data.newsFeed)
                self.nextPageValue = data.newsFeed.nextFrom ?? ""
                self.tableView.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func filterNews(newsFeed: NewsFeed) -> NewsFeed {
        newsFeed.items.forEach { item in
            if item.sourceId ?? 0 < 0 {
                guard let group = newsFeed.groups.filter({ group in
                    group.id == (item.sourceId ?? 0) * -1
                }).first else { return }
                item.authorName = group.name
                item.avatarUrl = group.photoImageName
            } else {
                guard let user = newsFeed.users.filter({ user in
                    user.id == item.sourceId
                }).first else { return }
                item.authorName = "\(user.firstName) \(user.lastName)"
                item.avatarUrl = user.photoImageName
            }
        }
        return newsFeed
    }

    private func fetchActualNews() {
        let mostFreshNewsItemDate = news?.items.first?.date ?? Date().timeIntervalSince1970
        networkService.fetchNews(from: mostFreshNewsItemDate + 1) { [weak self] result in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            switch result {
            case let .success(data):
                guard data.newsFeed.items.count > 0,
                      let newsItems = self.news else { return }
                self.news?.items = self.filterNews(newsFeed: data.newsFeed).items + newsItems.items
                let indexSet = IndexSet(integersIn: 0 ..< data.newsFeed.items.count)
                self.tableView.insertSections(indexSet, with: .automatic)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func fetchNextPageNews() {
        guard let newsItems = news else { return }
        networkService.fetchNews(next: nextPageValue) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                let indexSet = IndexSet(
                    integersIn: newsItems.items.count ..< newsItems.items.count + data.newsFeed.items.count
                )
                self.news?.items.append(contentsOf: self.filterNews(newsFeed: data.newsFeed).items)
                self.nextPageValue = data.newsFeed.nextFrom ?? ""
                self.tableView.insertSections(indexSet, with: .automatic)
                self.isLoading = false
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    @objc private func refreshAction(_ sender: AnyObject) {
        fetchActualNews()
    }
}

// MARK: - UITableViewDataSource

extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTypes.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        news?.items.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = news?.items[indexPath.section] else { return UITableViewCell() }
        let cellType = CellType(rawValue: indexPath.row)
        switch cellType {
        case .header:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.headerTableViewCellIdentifier, for: indexPath
            ) as? HeaderTableViewCell else { return UITableViewCell() }
            cell.configure(item: item)
            return cell
        case .post:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postTextTableViewCellIdentifier, for: indexPath
            ) as? PostTextTableViewCell else { return UITableViewCell() }
            cell.configure(item: item, indexPath: indexPath.row)
            cell.delegate = self
            return cell
        case .photoPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postPhotoTableViewCellIdentifier, for: indexPath
            ) as? PostPhotoTableViewCell else { return UITableViewCell() }
            cell.configure(item: item)
            return cell
        case .footer:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.footerTableViewCellIdentifier, for: indexPath
            ) as? FooterTableViewCell else { return UITableViewCell() }
            cell.configure(item: item)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDataSourcePrefetching

extension NewsFeedViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let maxSectionNumber = indexPaths.map(\.section).max(),
              let news = news else { return }
        if maxSectionNumber > news.items.count - 3, !isLoading {
            isLoading = true
            fetchNextPageNews()
        }
    }
}

// MARK: - UITableViewDelegate

extension NewsFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            let tableWidth = tableView.bounds.width
            guard let news = news?.items[indexPath.section].attachments?.first?.photo?.urls.last?.aspectRation else {
                return CGFloat()
            }
            let cellHeight = tableWidth / news
            return cellHeight
        default:
            return UITableView.automaticDimension
        }
    }
}

// MARK: - PostTextTableViewCellDelegate

extension NewsFeedViewController: PostTextTableViewCellDelegate {
    func undateCell(rowNumber: Int) {
        tableView.reloadRows(at: [IndexPath(row: rowNumber, section: 0)], with: .automatic)
    }
}
