// Url.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Ссылка на фото
class Url: Object, Decodable {
    @objc dynamic var url: String
}
