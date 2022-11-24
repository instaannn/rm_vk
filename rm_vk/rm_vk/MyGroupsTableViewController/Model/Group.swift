// Group.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Группа
class Group: Object, Decodable {
    @objc dynamic var subtitle: String?
    @objc dynamic var name: String
    @objc dynamic var photoImageName: String?

    private enum CodingKeys: String, CodingKey {
        case subtitle = "description"
        case name
        case photoImageName = "photo_100"
    }
}
