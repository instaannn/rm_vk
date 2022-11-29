// Group.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Группа
final class Group: Object, Decodable {
    @Persisted var subtitle: String?
    @Persisted var name: String
    @Persisted var photoImageName: String?
    @Persisted(primaryKey: true) var id = 0

    private enum CodingKeys: String, CodingKey {
        case subtitle = "description"
        case name
        case photoImageName = "photo_100"
        case id
    }
}
