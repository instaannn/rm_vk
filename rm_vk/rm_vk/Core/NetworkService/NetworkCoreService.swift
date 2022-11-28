// NetworkCoreService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire

/// Сетевые запросы
final class NetworkCoreService {
    // MARK: - Public methods

    func downloadJson<T: Decodable>(url: String, complition: @escaping (Result<T, Error>) -> Void) {
        AF.request("\(Api.baseUrl)\(url)\(Api.version)").responseJSON { response in
            guard let data = response.data else { return }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                complition(.success(object))
            } catch {
                complition(.failure(error))
            }
        }
    }
}
