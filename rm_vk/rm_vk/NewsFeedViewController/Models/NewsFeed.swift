// NewsFeed.swift
// Copyright © RoadMap. All rights reserved.

/// Новости
class NewsFeed: Decodable {
    /// Список новостей
    var items: [Items]
    /// Список пользователей с новостями
    let users: [User]
    /// Список групп с новостями
    let groups: [Group]
    /// Загрузка следующей страницы новостей
    let nextFrom: String?

    private enum CodingKeys: String, CodingKey {
        case users = "profiles"
        case items
        case groups
        case nextFrom = "next_from"
    }
}
