// ResponseNews.swift
// Copyright © RoadMap. All rights reserved.

/// Ответ все новости
struct ResponseNews: Decodable {
    /// Лента новостей
    let newsFeed: NewsFeed

    private enum CodingKeys: String, CodingKey {
        case newsFeed = "response"
    }
}
