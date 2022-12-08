// Groups.swift
// Copyright © RoadMap. All rights reserved.

/// Список групп
struct Groups: Decodable {
    /// Список групп
    let groups: [Group]

    private enum CodingKeys: String, CodingKey {
        case groups = "items"
    }
}
