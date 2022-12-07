// Url.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Ссылка на фото
final class Url: Object, Decodable {
    /// Ссылка на фото
    @objc dynamic var url: String
}
