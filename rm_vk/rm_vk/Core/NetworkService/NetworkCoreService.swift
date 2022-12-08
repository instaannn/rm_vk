// NetworkCoreService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire

/// Сетевые запросы
final class NetworkCoreService {
    // MARK: - Public methods

    func downloadJson<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request("\(Api.baseUrl)\(url)\(Api.version)").responseJSON { response in
            guard let data = response.data else { return }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func sendRequest(url: String) -> DataRequest {
        let request = AF.request("\(Api.baseUrl)\(url)\(Api.version)")
        return request
    }

    func getGroups(urlString: String) {
        let opq = OperationQueue()
        let request = sendRequest(url: urlString)
        let getDataOperation = GetDataOperation(request: request)
        opq.addOperation(getDataOperation)
        let parseDataOperation = ParseDataOperation()
        parseDataOperation.addDependency(getDataOperation)
        opq.addOperation(parseDataOperation)
        let saveToRealmOperation = SaveToRealmOperation()
        saveToRealmOperation.addDependency(parseDataOperation)
        opq.addOperation(saveToRealmOperation)
    }
}
