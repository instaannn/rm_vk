// Attachments.swift
// Copyright © RoadMap. All rights reserved.

/// Фото
struct Attachments: Decodable {
    let photos: Photo?

    private enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}
