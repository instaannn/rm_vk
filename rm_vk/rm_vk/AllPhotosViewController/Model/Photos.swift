// Photos.swift
// Copyright © RoadMap. All rights reserved.

/// Все фото
struct Photos: Decodable {
    /// Фотографии
    let photos: [Photo]

    private enum CodingKeys: String, CodingKey {
        case photos = "items"
    }
}
