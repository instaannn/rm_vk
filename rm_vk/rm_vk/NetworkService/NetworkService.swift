// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сетевые запросы
final class NetWorkService {
    // MARK: - Public methods

    func sendRequest(urlString: String) {
        AF.request("\(Api.baseUrl)\(urlString)\(Api.version)").responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
}
