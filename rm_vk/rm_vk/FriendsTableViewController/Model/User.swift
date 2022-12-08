// User.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Пользователь
final class User: Object, Decodable {
    /// id пользователя
    @Persisted(primaryKey: true) var id = 0
    /// Имя
    @Persisted var firstName: String
    /// Фамилия
    @Persisted var lastName: String
    /// Ссылка на аватарку
    @Persisted var photoImageName: String?
    /// Город пользователя
    @Persisted var city: City?

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photoImageName = "photo_100"
        case city
    }
}
