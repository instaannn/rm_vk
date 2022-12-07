// Items.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Новость
struct Items: Decodable {
    /// дата новости
    let date: TimeInterval?
    /// id владельца новости
    let sourceId: Int?
    /// текст новости
    let text: String?
    /// вложения к посту
    let attachments: [Attachments]?
    /// количество просмотров
    let views: Count?

    private enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case date
        case text
        case attachments
        case views
    }
}
