// Photo.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Фото
final class Photo: Object, Decodable {
    @Persisted(primaryKey: true) var id = 0
    @Persisted var urls: List<Url>
    @Persisted var ownerId: Int

    private enum CodingKeys: String, CodingKey {
        case urls = "sizes"
        case id
        case ownerId = "owner_id"
    }
}
