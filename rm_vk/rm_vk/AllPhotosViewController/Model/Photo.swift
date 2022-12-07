// Photo.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Фото
final class Photo: Object, Decodable {
    /// id фото
    @Persisted(primaryKey: true) var id = 0
    /// ссылки на фотографии
    @Persisted var urls: List<Url>
    /// id пользователя
    @Persisted var ownerId: Int

    private enum CodingKeys: String, CodingKey {
        case urls = "sizes"
        case id
        case ownerId = "owner_id"
    }
}
