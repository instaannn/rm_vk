// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Вызовы сетевых запросов
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Private Properties

    private let networkCoreService = NetworkCoreService()

    // MARK: - Public methods

    func fetchPhotos(for id: String, completion: @escaping (Result<ResponsePhotos, Error>) -> Void) {
        networkCoreService.downloadJson(url: RequestType.photos(id: id).urlString, completion: completion)
    }

    func fetchSearchGroups(for searchText: String, completion: @escaping (Result<ResponseGroups, Error>) -> Void) {
        networkCoreService.downloadJson(
            url: RequestType.searchGroups(searchQuery: searchText).urlString,
            completion: completion
        )
    }

    func fetchNews(completion: @escaping (Result<ResponseNews, Error>) -> Void) {
        networkCoreService.downloadJson(url: RequestType.news.urlString, completion: completion)
    }

    func fetchGroups() {
        networkCoreService.fetchGroups(urlString: RequestType.groups.urlString)
    }
}
