// GetDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Операция на получение данных
final class GetDataOperation: AsyncOperation {
    // MARK: - Public Properties

    var data: Data?

    // MARK: - Private Properties

    private var request: DataRequest

    // MARK: - Initializers

    init(request: DataRequest) {
        self.request = request
    }

    // MARK: - Public methods

    override func cancel() {
        request.cancel()
        super.cancel()
    }

    override func main() {
        request.responseData(queue: DispatchQueue.global()) { [weak self] response in
            guard let self = self else { return }
            self.data = response.data
            self.state = .finished
        }
    }
}
