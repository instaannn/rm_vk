// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Сохранение и чтение данных из реалм
final class RealmService {
    // MARK: - Private Properties

    private static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

    // MARK: - Public methods

    static func save<T: Object>(items: [T]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(items, update: .modified)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    static func get<T: Object>(
        _ type: T.Type,
        config: Realm.Configuration = Realm.Configuration.defaultConfiguration
    ) -> Results<T>? {
        do {
            let realm = try Realm(configuration: deleteIfMigration)
            return realm.objects(type)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
