// User.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Пользователь
final class User: Object, Decodable {
    @Persisted(primaryKey: true) var id = 0
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var photoImageName: String?
    @Persisted var city: City?

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photoImageName = "photo_100"
        case city
    }
}
