// ResponsePhotos.swift
// Copyright © RoadMap. All rights reserved.

/// Ответ все фото пользователя
struct ResponsePhotos: Decodable {
    /// Все фото пользователя
    let photos: Photos

    private enum CodingKeys: String, CodingKey {
        case photos = "response"
    }
}
