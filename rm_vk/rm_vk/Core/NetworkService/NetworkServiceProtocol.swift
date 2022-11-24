// NetworkServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол для сетевого слоя
protocol NetworkServiceProtocol {
    func fetchFriends(complition: @escaping (Result<ResponseUsers, Error>) -> Void)
    func fetchGroups(complition: @escaping (Result<ResponseGroups, Error>) -> Void)
    func fetchPhotos(for id: String, complition: @escaping (Result<ResponsePhotos, Error>) -> Void)
    func fetchSearchGroups(for searchText: String, complition: @escaping (Result<ResponseGroups, Error>) -> Void)
}
