// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Вызовы сетевых запросов
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Private Properties

    private let core = Core()

    // MARK: - Public methods

    func fetchFriends(complition: @escaping (Result<ResponseUsers, Error>) -> Void) {
        core.downloadJson(url: RequestType.friends.urlString, complition: complition)
    }

    func fetchGroups(complition: @escaping (Result<ResponseGroups, Error>) -> Void) {
        core.downloadJson(url: RequestType.groups.urlString, complition: complition)
    }

    func fetchPhotos(for id: String, complition: @escaping (Result<ResponsePhotos, Error>) -> Void) {
        core.downloadJson(url: RequestType.photos(id: id).urlString, complition: complition)
    }

    func fetchSearchGroups(for searchText: String, complition: @escaping (Result<ResponseGroups, Error>) -> Void) {
        core.downloadJson(url: RequestType.searchGroups(searchQuery: searchText).urlString, complition: complition)
    }
}
