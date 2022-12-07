// NewsFeed.swift
// Copyright © RoadMap. All rights reserved.

/// Новости
struct NewsFeed: Decodable {
    let items: [Items]
    let users: [User]
    let groups: [Group]

    private enum CodingKeys: String, CodingKey {
        case users = "profiles"
        case items
        case groups
    }
}
