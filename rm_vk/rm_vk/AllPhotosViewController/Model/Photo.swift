// Photo.swift
// Copyright © RoadMap. All rights reserved.

/// Фото
class Photo: Decodable {
    let urls: [Url]

    private enum CodingKeys: String, CodingKey {
        case urls = "sizes"
    }
}
