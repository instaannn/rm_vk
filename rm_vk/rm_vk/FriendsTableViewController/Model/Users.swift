// Users.swift
// Copyright © RoadMap. All rights reserved.

/// Список пользователей
struct Users: Decodable {
    /// Список пользователей
    let users: [User]

    private enum CodingKeys: String, CodingKey {
        case users = "items"
    }
}
