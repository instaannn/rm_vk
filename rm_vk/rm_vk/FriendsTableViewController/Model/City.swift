// City.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Город
final class City: Object, Decodable {
    /// Название города
    @objc dynamic var title: String
}
