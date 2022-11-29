// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Сохранение в базу данных
final class RealmService {
    static func save<T: Object>(items: [T]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(items, update: .modified)
            }
        } catch {
            print(error)
        }
    }
}
