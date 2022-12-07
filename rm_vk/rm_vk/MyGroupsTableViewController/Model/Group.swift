// Group.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Группа
final class Group: Object, Decodable {
    /// Описание групп
    @Persisted var subtitle: String?
    /// Название группы
    @Persisted var name: String
    /// Ссылка на аватарку
    @Persisted var photoImageName: String?
    /// id группы
    @Persisted(primaryKey: true) var id = 0

    private enum CodingKeys: String, CodingKey {
        case subtitle = "description"
        case name
        case photoImageName = "photo_100"
        case id
    }
}
