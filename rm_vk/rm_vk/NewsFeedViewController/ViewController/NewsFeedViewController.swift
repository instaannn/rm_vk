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

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol = NetworkService()
    private var items: [CellType] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }

    // MARK: - Private Methods

    private func fetchNews() {
        networkService.fetchNews { result in
            switch result {
            case let .success(data):
                self.generateItems(data: data)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func generateItems(data: ResponseNews) {
        data.newsFeed.items.forEach { item in
            if item.text != nil {
                let date = Date(timeIntervalSince1970: item.date ?? 0)
                guard let dateString = DateFormatter.bigDateFormatter
                    .string(for: date) else { return }
                if item.sourceId ?? 0 < 0 {
                    guard let group = data.newsFeed.groups.filter({ group in
                        group.id == (item.sourceId ?? 0) * -1
                    }).first else { return }
                    self.items.append(
                        CellType.header(
                            item: HeaderItem(
                                title: group.name,
                                subtitle: dateString,
                                avatarImageName: group.photoImageName ?? ""
                            )
                        )
                    )
                } else {
                    guard let friend = data.newsFeed.users.filter({ friends in
                        friends.id == item.sourceId
                    }).first else { return }
                    self.items.append(
                        CellType.header(
                            item: HeaderItem(
                                title: "\(friend.firstName) \(friend.lastName)",
                                subtitle: dateString,
                                avatarImageName: friend.photoImageName ?? ""
                            )
                        )
                    )
                }
                self.items.append(.post(item: PostItem(text: item.text ?? "")))
                if item.attachments != nil {
                    self.items.append(.photoPost(item: item.attachments?.first?.photos?.urls.last?.url ?? ""))
                }
                self.items.append(.footer(item: item.views?.count ?? 0))
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case let .header(item):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.headerTableViewCellIdentifier, for: indexPath
            ) as? HeaderTableViewCell else { return UITableViewCell() }
            cell.configure(news: item)
            return cell
        case let .post(item):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postTextTableViewCellIdentifier, for: indexPath
            ) as? PostTextTableViewCell else { return UITableViewCell() }
            cell.configure(news: item)
            return cell
        case let .photoPost(item):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postPhotoTableViewCellIdentifier, for: indexPath
            ) as? PostPhotoTableViewCell else { return UITableViewCell() }
            cell.configure(news: item)
            return cell
        case let .footer(item):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.footerTableViewCellIdentifier, for: indexPath
            ) as? FooterTableViewCell else { return UITableViewCell() }
            cell.configure(count: item)
            return cell
        }
    }
}
