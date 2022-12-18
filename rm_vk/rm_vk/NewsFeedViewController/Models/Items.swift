// Items.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Новость
class Items: Decodable {
    /// дата новости
    let date: TimeInterval?
    /// id владельца новости
    let sourceId: Int?
    /// текст новости
    let text: String?
    /// вложения к посту
    let attachments: [Attachment]?
    /// количество просмотров
    let views: Count?
    /// имя автора новости
    var authorName: String?
    /// аватар автора новости
    var avatarUrl: String?

    private enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case date
        case text
        case attachments
        case views
    }
}
