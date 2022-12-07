// Items.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Новости
struct Items: Decodable {
    let date: TimeInterval?
    let sourceId: Int?
    let text: String?
    let attachments: [Attachments]?
    let views: Count?

    private enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case date
        case text
        case attachments
        case views
    }
}
