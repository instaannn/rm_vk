// User.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Пользователь
class User: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var photoImageName: String?
    @objc dynamic var city: City?

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photoImageName = "photo_100"
        case city
    }
}
