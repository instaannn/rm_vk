// SaveToRealmOperation.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Операция сохранения в Realm
final class SaveToRealmOperation: Operation {
    // MARK: - Public methods

    override func main() {
        guard let parseData = dependencies.first as? ParseDataOperation else { return }
        RealmService.save(items: parseData.groups)
    }
}
