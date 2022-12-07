// ResponseGroups.swift
// Copyright © RoadMap. All rights reserved.

/// Ответ группы пользователя
struct ResponseGroups: Decodable {
    /// Группы пользователя
    let groups: Groups

    private enum CodingKeys: String, CodingKey {
        case groups = "response"
    }
}
