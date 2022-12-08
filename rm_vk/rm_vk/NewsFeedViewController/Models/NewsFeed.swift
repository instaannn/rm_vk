// NewsFeed.swift
// Copyright © RoadMap. All rights reserved.

/// Новости
struct NewsFeed: Decodable {
    /// Список новостей
    let items: [Items]
    /// Список пользователей с новостями
    let users: [User]
    /// Список групп с новостями
    let groups: [Group]

    private enum CodingKeys: String, CodingKey {
        case users = "profiles"
        case items
        case groups
    }
}
