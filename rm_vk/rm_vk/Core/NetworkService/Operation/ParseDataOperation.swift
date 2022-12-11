// ParseDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Операция парсинга данных
final class ParseDataOperation: Operation {
    // MARK: - Public Properties

    var groups: [Group] = []

    // MARK: - Public methods

    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data else { return }
        do {
            let response = try JSONDecoder().decode(ResponseGroups.self, from: data)
            groups = response.groups.groups
        } catch {
            print(error.localizedDescription)
        }
    }
}
