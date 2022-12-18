// NetworkServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для сетевого слоя
protocol NetworkServiceProtocol {
    func fetchPhotos(for id: String, completion: @escaping (Result<ResponsePhotos, Error>) -> Void)
    func fetchSearchGroups(for searchText: String, completion: @escaping (Result<ResponseGroups, Error>) -> Void)
    func fetchNews(
        from startTime: TimeInterval?,
        next startFrom: String?,
        completion: @escaping (Result<ResponseNews, Error>) -> Void
    )
    func fetchGroups()
}
